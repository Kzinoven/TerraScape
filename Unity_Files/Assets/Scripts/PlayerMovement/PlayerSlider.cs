using UnityEngine;
using System.Collections;

public class PlayerSlider : MonoBehaviour {

	public float jumpSpeed  = 8.0f;
	public float gravity = 10.0f;
	private Vector3 moveDirection = Vector3.zero;
	public Transform tracker;
	public float rotateSpeed = 3.0f;
	public CharacterController controller;
	public float maxSpeed = 20f;
	public static PlayerSlider instance;

	private float elevationAngle = 0;
	private float turnAngle = 0;//negative is right, positive is left (from behind)

	public float maxTiltAngle = 20f;
	public float tiltSpeed = 15f; //degrees per second

	public float maxRotationSpeed = 10f;//forward speed at which maximum rotation is reached

	private ThirdPersonController walker;	//reference to walker script

	// Use this for initialization
	void Awake () {
		instance = this;
		walker = GetComponent<ThirdPersonController> ();
	}
	
	// Update is called once per frame
	void Update () {
		//turn towards the forward direction
		//transform.Rotate(0, Input.GetAxis ("Horizontal") * rotateSpeed, 0);
		//Vector3 forward = transform.TransformDirection(Vector3.forward);
		//float curSpeed = speed * Input.GetAxis ("Vertical");
		//controller.SimpleMove(forward * curSpeed);

		//angle of elevation
		elevationAngle = transform.eulerAngles.x;
		elevationAngle *= Mathf.Deg2Rad; // trig functions use radians

		RaycastHit hit1, hit2 ;

		//check that there is terrain directly below and in front
		if (Physics.Raycast(tracker.position, -Vector3.up, out hit1)) {
			if (Physics.Raycast(tracker.TransformPoint(Vector3.forward * 0.1f), -Vector3.up, out hit2)) {
				transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.LookRotation(hit2.point - hit1.point, hit1.normal), Time.deltaTime * 20);
			}
			if (controller.isGrounded) 
			{
				// We are grounded, so recalculate
				// move direction directly from axes
				/*moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0,
				                        Input.GetAxis("Vertical"));
				moveDirection = transform.TransformDirection(moveDirection);
				moveDirection *= speed;*/

				//adjust turn angle by 10 degrees per second, max 20 degrees angle
				float angleChange = 10 * Time.deltaTime;
				float horizontal = Input.GetAxis("Horizontal");
				if (horizontal > 0) // positive, turn to right (from behind is negative angle)
				{
					if ((turnAngle -= angleChange) < -20)
						turnAngle = -20;
				} else if (horizontal < 0) //negative, turn to left (from behind is positive angle)
				{
					if ((turnAngle += angleChange) > 20)
						turnAngle = 20;
				} else if (horizontal == 0) // no input, turn to 0 rotation
				{
					float sign = Mathf.Sign(turnAngle);
					if ((turnAngle = Mathf.Abs(turnAngle) - angleChange) < 0)
						turnAngle = 0;
					turnAngle *= sign;
				}

				/*
				//simulate turning by rotating around pivot
				//only turn if tilt is above threshold
				if (Mathf.Abs(turnAngle) > 0.5)
				{

					//positive is right, negative is left
					float direction = Mathf.Sign(turnAngle) * -1f;
					//angle from surface of the terrain measured from right side
					float terrainTilt = turnAngle + 90;

					//closer terrainTilt is to 90 degrees (straight up), larger turn radius and multiplier will be (positive is to the right)
					float turnMultiplier = Mathf.Abs(Mathf.Tan(terrainTilt * Mathf.Deg2Rad));

					//create a transform that corrects for tilting
					Transform correctedTransform = transform;
					transform.rotation = Quaternion.Euler (transform.eulerAngles.x, transform.eulerAngles.y, 0);

					//don't want multiplier and turn radius at 90 degrees to be 0, so increase magnitude of multiplier by 1
					//get direction back from sign of turnAngle (negative turnAngle = right = positive multiplier)
					turnMultiplier += 1;

					float turnRadius = Mathf.Abs(minTurnRadius * turnMultiplier);

					//add radius directly to right or left of player and get center of turn circle in world coordinates
					Ray turnDirection = new Ray(transform.position, correctedTransform.TransformDirection(Vector3.right) * direction);
					Vector3 turnPoint = turnDirection.GetPoint(turnRadius);
					pivotTest.transform.position = turnPoint;
					//angular velocity (degrees per second) is speed / radius
					float angularVelocity = rigidbody.velocity.magnitude / turnRadius;

					//now rotate around the point - need to get relative up direction and correct for leaning
					transform.RotateAround(turnPoint, correctedTransform.TransformDirection(Vector3.up), angularVelocity * Time.deltaTime);

				}*/
				//transform.rotation = Quaternion.Euler (transform.eulerAngles.x, transform.eulerAngles.y, turnAngle);//rotate around z axis
				transform.Rotate(new Vector3(0, turnAngle * -0.05f * Mathf.Clamp(rigidbody.velocity.magnitude / maxRotationSpeed, 0, 1), 0), Space.World);

				//trail renderer not ready yet
				// GetComponent("TrailRenderer").enabled = true;

				if (Input.GetButton ("Jump")) {
					moveDirection.y = jumpSpeed;
				}
			} else if (!controller.isGrounded)
			{

				//disable trailrenderer
				//GetComponent("TrailRenderer").enabled = false;
			}

			// Move the controller
			//controller.Move(moveDirection * Time.deltaTime);	
		}
		
		//stop sliding
		if (Input.GetKeyDown(KeyCode.N))
		{
			Debug.Log("Stopped sliding.");
			walker.stopSliding();
			this.enabled = false;
		}

	}

	void FixedUpdate () {


		if (controller.isGrounded)
		{
			if (Input.GetKey(KeyCode.W))//hold w to go forward
			{
				rigidbody.AddRelativeForce(Vector3.forward * 1000.0f);
			}

			rigidbody.AddRelativeForce(Vector3.forward * 65 * gravity * Mathf.Sin(elevationAngle)); //forward force = m * g * sin(angle)

			Vector3 velocityDirection = rigidbody.velocity.normalized;
			Vector3 facingDirection =  transform.TransformDirection(Vector3.forward);

			//if velocity is not in the same direction as the transform, add a force to 
			if (velocityDirection != facingDirection && rigidbody.velocity.sqrMagnitude > 0.2)
			{
				//if foward direction is to the right, add a force to the left
				//http://forum.unity3d.com/threads/left-right-test-function.31420/
				float direction = 0; // -1 is left, 1 is right
				Vector3 perpendicular = Vector3.Cross(facingDirection, velocityDirection);
				direction = Mathf.Sign(Vector3.Dot(perpendicular, transform.TransformDirection(Vector3.up)));//-1 if left, 1 if right
				
				rigidbody.AddRelativeForce(Vector3.left * rigidbody.velocity.magnitude * rigidbody.mass * direction * Mathf.Sin(Vector3.Angle(velocityDirection, facingDirection)));
			}
			Debug.Log(Vector3.Angle(velocityDirection, facingDirection));
			//rigidbody.AddRelativeForce(Vector3.right * 65 * gravity * Mathf.Sin(elevationAngle) * Mathf.Cos(turnAngle * Mathf.Deg2Rad));//turning force = m * g * sin(elevation angle) * cos (turn angle)

		} else
		{
			rigidbody.AddForce (-Vector3.up * gravity);
		}
		//limit speed
		if (rigidbody.velocity.sqrMagnitude > maxSpeed * maxSpeed)
		{
			rigidbody.velocity = rigidbody.velocity.normalized * maxSpeed;
		}
	}
}
