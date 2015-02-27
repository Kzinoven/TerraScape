// Converted from UnityScript to C# at http://www.M2H.nl/files/js_to_c.php - by Mike Hergaarden
// Do test the code! You usually need to change a few small bits.

using UnityEngine;
using System.Collections;
[RequireComponent(typeof (Animator))]
//[RequireComponent(typeof (CapsuleCollider))]
[RequireComponent(typeof (CharacterController))]
//[RequireComponent(typeof (Rigidbody))]
[RequireComponent(typeof (PlayerSlider))]
public class ThirdPersonController : MonoBehaviour 
{
	public float animSpeed = 1.5f;				// a public setting for overall animator animation speed
	public float lookSmoother = 3f;				// a smoothing setting for camera motion
	public bool useCurves;						// a setting for teaching purposes to show use of curves
	

	private Animator anim;							// a reference to the animator on the character
	//private CapsuleCollider col;					// a reference to the capsule collider of the character
// Require a character controller to be attached to the same game object
//@script RequireComponent(CharacterController)
	private PlayerSlider slider;				//slider script


	enum CharacterState {
		Idle = 0,
		Walking = 1,
		Trotting = 2,
		Running = 3,
		Jumping = 4,
	}

	private CharacterState _characterState;
		private bool animRun = false;
		private bool animWalk = false;
		private bool animJump = false;
		public bool movable = true;
		public bool hanging = false;
		private bool switching = false;
		private bool action = false;
		public float ledgeClimbSpeed = 4.0f;
		public float shimmySpeed = 1.0f;
		public bool climb = false;
		public int cutScene = 0;
		public static ThirdPersonController instance;
		private Player management;
		private int switchTime;
		public float toolInUse;
		private int itemUse;
		public Transform checkPoint;
	// The speed when walking
	public float walkSpeed= 2.0f;
	// after trotAfterSeconds of walking we trot with trotSpeed
	public float trotSpeed= 4.0f;
	// when pressing "Fire3" button (cmd) we start running
	public float runSpeed= 6.0f;

	public float inAirControlAcceleration= 3.0f;

	// How high do we jump when pressing jump and letting go immediately
	public float jumpHeight= 0.5f;

	// The gravity for the character
	public float gravity= 20.0f;
	// The gravity in controlled descent mode
	public float speedSmoothing= 10.0f;
	public float rotateSpeed= 500.0f;
	public float trotAfterSeconds= 3.0f;

	public bool canJump= true;

	//minimum initial slide speed and angle of elevation
	public float initSlideSpeed = 10;
	public float initSlideAngle = 25;

	private float jumpRepeatTime= 0.05f;
	private float jumpTimeout= 0.15f;
	private float groundedTimeout= 0.25f;

	// The camera doesnt start following the target immediately but waits for a split second to avoid too much waving around.
	private float lockCameraTimer= 0.0f;

	// The current move direction in x-z
	public Vector3 moveDirection= Vector3.zero;

	//movement for this frame
	private Vector3 movement = Vector3.zero;

	// The current vertical speed
	public float verticalSpeed= 0.0f;
	// The current x-z move speed
	public float moveSpeed= 0.0f;

	// The last collision flags returned from controller.Move
	private CollisionFlags collisionFlags; 

	// Are we jumping? (Initiated with jump button and not grounded yet)
	private bool jumping= false;
	private bool jumpingReachedApex= false;

	// Are we moving backwards (This locks the camera to not do a 180 degree spin)
	private bool movingBack= false;
	// Is the user pressing any keys?
	private bool isMoving= false;
	// When did the user start walking (Used for going into trot after a while)
	private float walkTimeStart= 0.0f;
	// Last time the jump button was clicked down
	private float lastJumpButtonTime= -10.0f;
	// Last time we performed a jump
	private float lastJumpTime= -1.0f;


	// the height we jumped from (Used to determine for how long to apply extra jump power after jumping.)
	private float lastJumpStartHeight= 0.0f;

	//is the player sliding?
	private bool isSliding = false;

	//is the player blocking with the shield?a
	private bool blocking = false;

	public Vector3 inAirVelocity= Vector3.zero;

	private float lastGroundedTime= 0.0f;

	private CharacterController controller;

	private CapsuleCollider slidingCollider;

	private bool isControllable= true;

	void  Awake ()
	{
		moveDirection = transform.TransformDirection(Vector3.forward);
		anim = GetComponent<Animator>();		
		instance = this;
		//col = GetComponent<CapsuleCollider>();	
		slider = GetComponent<PlayerSlider> ();
		slider.enabled = false;
		management = GetComponent<Player>();
		controller = GetComponent<CharacterController>();
		slidingCollider = GetComponent<CapsuleCollider> ();
	}


	void  UpdateSmoothedMovementDirection ()
	{
		Transform cameraTransform= Camera.main.transform;
		bool grounded= IsGrounded();
		// Forward vector relative to the camera along the x-z plane	
		Vector3 forward= cameraTransform.TransformDirection(Vector3.forward);
		forward.y = 0;
		forward = forward.normalized;

		// Right vector relative to the camera
		// Always orthogonal to the forward vector
		Vector3 right= new Vector3(forward.z, 0, -forward.x);

		float v= Input.GetAxisRaw("Vertical");
		float h= Input.GetAxisRaw("Horizontal");

		// Are we moving backwards or looking backwards
		if (v < -0.2f)
			movingBack = true;
		else
			movingBack = false;
		
		bool wasMoving= isMoving;
		isMoving = Mathf.Abs (h) > 0.1f || Mathf.Abs (v) > 0.1f;
			
		// Target direction relative to the camera
		Vector3 targetDirection= h * right + v * forward;
		if (hanging)
			grounded = true;
		// Grounded controls
		if (grounded)
		{
			// Lock camera for short period when transitioning moving & standing still
			lockCameraTimer += Time.deltaTime;
			if (isMoving != wasMoving)
				lockCameraTimer = 0.0f;

			// We store speed and direction seperately,
			// so that when the character stands still we still have a valid forward direction
			// moveDirection is always normalized, and we only update it if there is user input.
				if (targetDirection != Vector3.zero)
			{
				// If we are really slow, just snap to the target direction
				if (moveSpeed < walkSpeed * 0.9f && grounded)
				{
					moveDirection = targetDirection.normalized;
				}
				// Otherwise smoothly turn towards it
				else
				{
					moveDirection = Vector3.RotateTowards(moveDirection, targetDirection, rotateSpeed * Mathf.Deg2Rad * Time.deltaTime, 1000);
					moveDirection = moveDirection.normalized;
					
				}
			}
			
			// Smooth the speed based on the current target direction
			float curSmooth= speedSmoothing * Time.deltaTime;
			
			// Choose target speed
			//* We want to support analog input but make sure you cant walk faster diagonally than just forward or sideways
			float targetSpeed= Mathf.Min(targetDirection.magnitude, 1.0f);
		
			_characterState = CharacterState.Idle;
			
			// Pick speed modifier
			//running burns 2 stamina per second 
			if ((Input.GetKey (KeyCode.LeftShift) || Input.GetKey (KeyCode.RightShift)) && management.useStamina(5f * Time.deltaTime))//running burns 5 stamina per second 
			{
				targetSpeed *= runSpeed;
				_characterState = CharacterState.Running;
				animRun = true;
				animWalk = false;
			}
			else if (Time.time - trotAfterSeconds > walkTimeStart)
			{
				targetSpeed *= trotSpeed;
				_characterState = CharacterState.Trotting;
				animWalk = true;
				animRun = false;
			}
			else
			{
				targetSpeed *= walkSpeed;
				_characterState = CharacterState.Walking;
				animWalk = true;
				animRun = false;
			}
			if (targetSpeed == 0.0f){
				animWalk = false;
				animRun = false;	
			}
			
			moveSpeed = Mathf.Lerp(moveSpeed, targetSpeed, curSmooth);
			if (hanging && moveSpeed > walkSpeed)
				moveSpeed = walkSpeed;
			
			// Reset walk time start when we slow down
			if (moveSpeed < walkSpeed * 0.3f)
				walkTimeStart = Time.time;


		}
		// In air controls
		else
		{
			// Lock camera while in air
			if (jumping)
				lockCameraTimer = 0.0f;
			
			if (isMoving)
				inAirVelocity += targetDirection.normalized * Time.deltaTime * inAirControlAcceleration;
		}	
	}

	public void startSliding()
	{
		isSliding = true;
		movable = false;
		hanging = false;
		Debug.Log ("Sliding");
		
		//enable ridigdbody
		rigidbody.isKinematic = false;
		rigidbody.detectCollisions = true;
		
		slider.enabled = true;
		
		controller.enabled = false;

		slidingCollider.enabled = true;

		float minZ = initSlideSpeed * Mathf.Cos(initSlideAngle * Mathf.Deg2Rad);
		float minY = initSlideSpeed * Mathf.Sin(initSlideAngle * Mathf.Deg2Rad);

		//character jumps forward when it starts sliding, give some initial upward and forward velocity if there is none
		Vector3 newVelocity = rigidbody.velocity;
		newVelocity.x = 0;
		if (rigidbody.velocity.z < minZ)
		{
			newVelocity.z = minZ;
		}
		if (rigidbody.velocity.y < minY)
		{
			newVelocity.y = minY;
		}
		rigidbody.velocity = transform.TransformDirection(newVelocity);
	}

	public void stopSliding()
	{
		isSliding = false;
		movable = true;
		Debug.Log ("Stop Sliding Please");
		moveDirection = rigidbody.velocity.normalized;
		movement += transform.up * 1.0f;
		//disable ridigdbody
		rigidbody.isKinematic = true;
		rigidbody.detectCollisions = false;

		slider.enabled = false;
		controller.enabled = true;
		slidingCollider.enabled = false;

		//return to original rotation - stand up straight
		//transform.rotation = Quaternion.Euler(new Vector3(0,transform.eulerAngles.y, 0));
	}

	void  ApplyJumping (){
		// Prevent jumping too fast after each other
		if (lastJumpTime + jumpRepeatTime > Time.time)
			return;

		if (IsGrounded()) {
			// Jump
			// - Only when pressing the button down
			// - With a timeout so you can press the button slightly before landing		
			if (canJump && Time.time < lastJumpButtonTime + jumpTimeout) {
				verticalSpeed = CalculateJumpVerticalSpeed (jumpHeight);
				SendMessage("DidJump", SendMessageOptions.DontRequireReceiver);
			}
		}
	}


	void  ApplyGravity ()
	{
		if (isControllable)	// don't move player at all if not controllable.
		{
			// Apply gravity
			bool jumpButton= Input.GetButton("Jump");
			
			
			// When we reach the apex of the jump we send out a message
			if (jumping && !jumpingReachedApex && verticalSpeed <= 0.0f)
			{
				jumpingReachedApex = true;
				SendMessage("DidJumpReachApex", SendMessageOptions.DontRequireReceiver);
				
			}
		
			if (IsGrounded ()){
				verticalSpeed = 0.0f;
				}
			else
				verticalSpeed -= gravity * Time.deltaTime;
		}
	}

	public float CalculateJumpVerticalSpeed ( float targetJumpHeight  )
	{
		// From the jump height and gravity we deduce the upwards speed 
		// for the character to reach at the apex.
		return Mathf.Sqrt(2 * targetJumpHeight * gravity);
	}

	public void DidJump ()
	{
		jumping = true;
		animJump = true;
		jumpingReachedApex = false;
		lastJumpTime = Time.time;
		lastJumpStartHeight = transform.position.y;
		lastJumpButtonTime = -10;
		
		_characterState = CharacterState.Jumping;
	}

	void Update ()
	{
		//Debug.Log (transform.eulerAngles.y);
		//Debug.Log (IsGrounded ());
		if (Input.GetKeyDown (KeyCode.P) && Input.GetKeyDown (KeyCode.O)){
			Application.LoadLevel(Application.loadedLevel);
		}
		if (!isControllable)
		{
			// kill all inputs if not controllable.
			Input.ResetInputAxes();
		}

		//not blocking unless key is held down
		if (Input.GetKeyUp(KeyCode.E)){
			blocking = false;
			Debug.Log("Guard is Down");
		}
		if(Input.GetKeyUp(KeyCode.E) && isSliding==false)
			itemUse = 0;
		if (Input.GetButtonDown ("Jump"))
		{
			lastJumpButtonTime = Time.time;
		}
		if (Input.GetKeyDown(KeyCode.N) && !hanging && !jumping && cutScene == 0)
		{
			slide();
		}
		if (!hanging && !isSliding && !jumping && cutScene==0){
			if (Input.GetKey(KeyCode.Z))
			{
				switchTime+=1;
				movable = false;
				switching = true;
				//cycle items LEFT
				if (switchTime>=100){
					management.CycleItems(true);
					switchTime=0;
				}
			}
			else if (Input.GetKey(KeyCode.C))
			{
				switchTime+=1;
				movable = false;
				switching = true;
				//Cycle items RIGHT
				if (switchTime>=100){
					management.CycleItems(false);
					switchTime=0;
				}
			}
			else if (switching == true && Input.GetKeyUp(KeyCode.C) || Input.GetKeyUp(KeyCode.Z)){
				switchTime=0;
				movable = true;
				switching = false;
			}
			if (Input.GetKeyDown(KeyCode.E) && !hanging && !jumping && cutScene==0)
			{
				//Use selected item or tool
				management.UseItem(management.selectedIndex);
			}
		}
		if (movable){

			anim.SetBool("shimmy", false);
			UpdateSmoothedMovementDirection();
			
			// Apply gravity
			// - extra power jump modifies gravity
			// - controlledDescent mode modifies gravity
			ApplyGravity ();

			// Apply jumping logic
			ApplyJumping ();
			
			// Calculate actual motion
			movement += (moveDirection * moveSpeed + new Vector3 (0, verticalSpeed, 0) + inAirVelocity) * Time.deltaTime;
			
			// Move the controller
			collisionFlags = controller.Move(movement);
			

			
			// Set rotation to the move direction
			if (IsGrounded())
			{
				
				transform.rotation = Quaternion.LookRotation(moveDirection);
				
					
			}	
			else
			{
				Vector3 xzMove= movement;
				xzMove.y = 0;
				if (xzMove.sqrMagnitude > 0.001f)
				{
					transform.rotation = Quaternion.LookRotation(xzMove);
				}
				
			}	
			
			// We are in jump mode but just became grounded
			if (IsGrounded())
			{
				lastGroundedTime = Time.time;
				inAirVelocity = Vector3.zero;
				if (jumping)
				{
					jumping = false;
					SendMessage("DidLand", SendMessageOptions.DontRequireReceiver);
					animJump = false;
				}
			}
		}
		else if (hanging) {
			//UpdateSmoothedMovementDirection();
			if (Input.GetButtonDown("Jump")){
				hanging = false;
				movable = true;
			}
			if (Input.GetKeyDown(KeyCode.W) || Input.GetKeyDown(KeyCode.UpArrow))
				climb=true;
			if (Input.GetKey(KeyCode.D) || Input.GetKey(KeyCode.RightArrow)){
				movement += transform.right * shimmySpeed * Time.deltaTime;
					
				// Move the controller
				collisionFlags = controller.Move(movement);
				anim.SetBool("shimmy", true);
			}
			else if (Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.LeftArrow)){
				movement += transform.right * -shimmySpeed * Time.deltaTime;
					
				// Move the controller
				collisionFlags = controller.Move(movement);
				anim.SetBool("shimmy", true);
			}
			else
				anim.SetBool("shimmy", false);
			if (climb){
				anim.SetBool("shimmy", false);
				verticalSpeed = ledgeClimbSpeed;
				movement += (new Vector3 (0, verticalSpeed, 0) + inAirVelocity) * Time.deltaTime;
					
				// Move the controller
				collisionFlags = controller.Move(movement);
			}

		}
		else if (isSliding)
		{ 
			animWalk = false;
			animRun = false;
			animJump = false;
			hanging = false;
			climb = false;
		}
		else {
			moveSpeed = 0.0f;
			verticalSpeed = 0.0f;
			animWalk = false;
			animRun = false;
			animJump = false;
			hanging = false;
			climb = false;
		}
		// ANIMATION sector
			anim.SetFloat("moveSpeed", moveSpeed);
			anim.SetFloat("vertSpeed", verticalSpeed);
			anim.SetBool ("walk", animWalk);
			anim.SetBool ("run", animRun);
			anim.SetBool ("jump", animJump);
			anim.SetBool ("hanging", hanging);
			anim.SetBool ("climb", climb);
			anim.SetInteger ("cutScene", cutScene);
			anim.SetBool ("switching", switching);
			anim.SetFloat ("tool", toolInUse);
			anim.SetInteger ("itemUse", itemUse);
	/*	if(_animation) {
			if(_characterState == CharacterState.Jumping) 
			{
				if(!jumpingReachedApex) {
					_animation[jumpPoseAnimation.name].speed = jumpAnimationSpeed;
					_animation[jumpPoseAnimation.name].wrapMode = WrapMode.ClampForever;
					_animation.CrossFade(jumpPoseAnimation.name);
				} else {
					_animation[jumpPoseAnimation.name].speed = -landAnimationSpeed;
					_animation[jumpPoseAnimation.name].wrapMode = WrapMode.ClampForever;
					_animation.CrossFade(jumpPoseAnimation.name);				
				}
			} 
			else 
			{
				if(controller.velocity.sqrMagnitude < 0.1f) {
					_animation.CrossFade(idleAnimation.name);
				}
				else 
				{
					if(_characterState == CharacterState.Running) {
						_animation[runAnimation.name].speed = Mathf.Clamp(controller.velocity.magnitude, 0.0f, runMaxAnimationSpeed);
						_animation.CrossFade(runAnimation.name);	
					}
					else if(_characterState == CharacterState.Trotting) {
						_animation[walkAnimation.name].speed = Mathf.Clamp(controller.velocity.magnitude, 0.0f, trotMaxAnimationSpeed);
						_animation.CrossFade(walkAnimation.name);	
					}
					else if(_characterState == CharacterState.Walking) {
						_animation[walkAnimation.name].speed = Mathf.Clamp(controller.velocity.magnitude, 0.0f, walkMaxAnimationSpeed);
						_animation.CrossFade(walkAnimation.name);	
					}
					
				}
			}
		}
		*/
		// ANIMATION sector

		//reset movement
		movement = Vector3.zero;
	}

	//attack the player and account for blocking and attack direction source: point of origin of attack damage:amount of damage to be dealt
	public void takeAttack (Vector3 source, float damage)
	{
		//get point attack is coming from, relative to player
		Vector3 attackDirection = transform.InverseTransformPoint (source);
		float attackAngle = Vector3.Angle (transform.TransformDirection(Vector3.forward), attackDirection);

		//if the player is blocking, is coming from in front of the player (within block angle), and has enough stamina to block, send the player back
		if (blocking && management.useStamina(25f) && attackAngle < 60f)
		{
			//play blocking hit animation
			anim.SetTrigger("block");
		}
		else //otherwise the player takes damage and is sent back a smaller distance
		{
			//play take damage animation
			anim.SetTrigger("hit");
			management.TakeDamage(damage);
		}
	}
	public void slide(){
			//start or stop sliding
			if (!isSliding){
				startSliding();
				itemUse = 2;
			}else{
				stopSliding();
				itemUse = 0;
			}
	}
	public void block(){
		blocking = true;
		Debug.Log ("Guard is up");
		itemUse = 1;
	}
	public void snap(){
		//stop player movement
		//wait X seconds
		itemUse = 1;
		//instantiate shot
		//return player movement
	}
	public void laser() {
		itemUse = 1;
	}
	public void trap() {
		//stop player movement
		//instantiate trap
		itemUse = 2;
		//return player movement when button is released
	}
	public void respawn(){
		this.transform.position = checkPoint.transform.position;
		this.transform.rotation = checkPoint.transform.rotation;
		verticalSpeed = 0.0f;
		moveSpeed = 0.0f;
		canJump = true;
		jumping = false;
		hanging = false;
		movable = true;
	}

	void OnControllerColliderHit ( ControllerColliderHit hit   )
	{
	//	Debug.DrawRay(hit.point, hit.normal);
		if (hit.moveDirection.y > 0.01f) 
			return;
	}

	public float GetSpeed ()
	{
		return moveSpeed;
	}

	public bool IsJumping ()
	{
		return jumping;
	}

	public bool IsGrounded ()
	{
		return (collisionFlags & CollisionFlags.CollidedBelow) != 0;
	}

	public Vector3 GetDirection ()
	{
		return moveDirection;
	}

	public bool IsMovingBackwards ()
	{
		return movingBack;
	}

	public float GetLockCameraTimer ()
	{
		return lockCameraTimer;
	}

	public bool IsMoving ()
	{
		 return Mathf.Abs(Input.GetAxisRaw("Vertical")) + Mathf.Abs(Input.GetAxisRaw("Horizontal")) > 0.5f;
	}

	public bool HasJumpReachedApex ()
	{
		return jumpingReachedApex;
	}

	public bool IsGroundedWithTimeout ()
	{
		return lastGroundedTime + groundedTimeout > Time.time;
	}

	public void Reset ()
	{
		gameObject.tag = "Player";
	}

}