using UnityEngine;
using System.Collections;

public class TP_Controller : MonoBehaviour 
{
    public static CharacterController characterController;
	public static CapsuleCollider collider;
    public static TP_Controller instance;

    public bool climbEnabled { get; set; }

    public GameItem interactingItem = null;
    public FaultLine activeFault = null;
    public TerrainDeformer activeTerrain = null;
    public float diggingMagnitude = 3.0f;
	public Rigidbody rigidbody;

	public bool isSliding;

    void Awake()
    {
        //Assign a static reference to the built-in character controller and set up the camera
        characterController = GetComponent("CharacterController") as CharacterController;
		collider = GetComponent ("CapsuleCollider") as CapsuleCollider;
        instance = this;
        TP_Camera.EstablishMainCamera();
		//rigidbody disabled unless sliding
		rigidbody.detectCollisions = false;
    }

    void Update()
    {
        //every frame, get all the input information and update the motion
        if (Camera.main == null)
        {
            return;
        }
        GetLocomotionInput();
        HandleActionInput();
		if (!isSliding)
		{
			TP_Motor.instance.UpdateMotor();
		}
		if (Input.GetKeyDown (KeyCode.N)) 
		{
			//Start/stop sliding
			if (TP_Motor.instance.isSliding){
				stopSliding();
			} else if (!TP_Motor.instance.isSliding){
				startSliding();
			}
			Debug.Log((TP_Motor.instance.isSliding ? "Started" : "Stopped") + " sliding");
		}
	}

    void GetLocomotionInput()
    {
        //gets WASD or arrow key information
        var deadZone = 0.1f;
        TP_Motor.instance.verticalVelocity = TP_Motor.instance.MoveVector.y;
        TP_Motor.instance.MoveVector = Vector3.zero;

		if (!TP_Motor.instance.isSliding)
		{
	        //ensure that the input exists outside of the dead zone
	        if (Input.GetAxis("Vertical") > deadZone || Input.GetAxis("Vertical") < -deadZone)
	        {
	            TP_Motor.instance.MoveVector += new Vector3(0, 0, Input.GetAxis("Vertical"));
	        }

	        if (Input.GetAxis("Horizontal") > deadZone || Input.GetAxis("Horizontal") < -deadZone)
	        {
	            TP_Motor.instance.MoveVector += new Vector3(Input.GetAxis("Horizontal"), 0, 0);
	        }
		}
        //Call on TP_Animator to decide what animation to play depending on the input
        TP_Animator.instance.DetermineCurrentMoveDirection();
    }

    void HandleActionInput()
    {
        if (Input.GetButton("Jump"))
        {
            if (climbEnabled)
                Climb();
            else
                Jump();
        }

        if (Input.GetKeyDown(KeyCode.Q))
        {
            //cycle items LEFT
            Player.instance.CycleItems(true);
        }

        if (Input.GetKeyDown(KeyCode.E))
        {
            //Cycle items RIGHT
            Player.instance.CycleItems(false);
        }

        if (Input.GetKeyDown(KeyCode.F))
        {
            //Use selected item or tool
            Player.instance.UseItem(Player.instance.selectedIndex);
        }
        if (Input.GetKeyDown(KeyCode.R))
        {
            //Interact or pick up item
            if (interactingItem == null)
            {
                //the controller is NOT currently intersecting a GameItem
                TP_Animator.instance.Interact(false);
            }
            else
            {
                //the controller IS currently intersecting a GameItem
                TP_Animator.instance.Interact(true);
                Player.instance.CollectItem(interactingItem);
                Destroy(interactingItem.gameObject);
            }
        }

        //Other actions will go here!
    }

	private void startSliding ()
	{
		//enable sliding colliders and physics
		TP_Motor.instance.isSliding = true;
		isSliding = true;
		TP_Motor.instance.enabled = false;
		rigidbody.isKinematic = false;
		rigidbody.detectCollisions = true;
		PlayerSlider.instance.enabled = true;

		GetComponent<CharacterController> ().enabled = false;
		//character jumps forward when it starts sliding, give some initial upward and forward velocity if there is none
		Vector3 newVelocity = rigidbody.velocity;
		if (rigidbody.velocity.z < 10)
		{
			newVelocity.z = 10;
		}
		if (rigidbody.velocity.y < 3)
		{
			newVelocity.y = 3;
		}
		rigidbody.velocity = transform.TransformDirection(newVelocity);

		//switch to slider camera
		(Camera.main.GetComponent ("TP_Camera") as TP_Camera).enabled = false;
		(Camera.main.GetComponent ("SliderCamera") as SliderCamera).enabled = true;
	}

	private void stopSliding ()
	{
		//disable rigidbody and physics
		TP_Motor.instance.isSliding = false;
		TP_Motor.instance.enabled = true;
		isSliding = false;
		rigidbody.isKinematic = true;
		rigidbody.detectCollisions = false;
		PlayerSlider.instance.enabled = false;
		transform.rotation = Quaternion.Euler(new Vector3(0,transform.eulerAngles.y, 0));//return to original rotation
		GetComponent<CharacterController> ().enabled = true;

		//change back to normal camera
		(Camera.main.GetComponent ("TP_Camera") as TP_Camera).enabled = true;
		(Camera.main.GetComponent ("SliderCamera") as SliderCamera).enabled = false;
	}

    public void Jump()
    {
        TP_Animator.instance.Jump();
        TP_Motor.instance.Jump();
    }

    void Climb()
    {
        TP_Animator.instance.Climb();
    }

    void OnTriggerEnter(Collider collider)
    {
        //Collided with a trigger!
        if (collider.gameObject.tag == "Item")
        {
            interactingItem = collider.gameObject.GetComponent<GameItem>();
            GUI_Manager.message.text = "Press R to pick up the " + interactingItem.itemName;
        }

        if (collider.gameObject.tag == "FaultLine")
        {
            activeFault = collider.gameObject.GetComponent<FaultLine>();
        }
    }

    void OnControllerColliderHit(ControllerColliderHit hit)
    {
        if (hit.gameObject.GetComponent<TerrainDeformer>() != null)
        {
            activeTerrain = hit.gameObject.GetComponent<TerrainDeformer>();
        }
        else
        {
            activeTerrain = null;
        }
    }

    void OnTriggerExit(Collider collider)
    {
        //Stopped colliding with a trigger!
        if (collider.gameObject.tag == "Item")
        {
            interactingItem = null;
            GUI_Manager.message.text = "";
        }

        if (collider.gameObject.tag == "FaultLine")
        {
            activeFault = null;
        }
    }
}
