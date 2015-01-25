using UnityEngine;
using System.Collections;

public class TP_Controller : MonoBehaviour 
{
    public static CharacterController characterController;
    public static TP_Controller instance;

    public bool climbEnabled { get; set; }

    public GameItem interactingItem = null;
    public FaultLine activeFault = null;
    public TerrainDeformer activeTerrain = null;
    public float diggingMagnitude = 3.0f;

    void Awake()
    {
        //Assign a static reference to the built-in character controller and set up the camera
        characterController = GetComponent("CharacterController") as CharacterController;
        instance = this;
        TP_Camera.EstablishMainCamera();
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
        TP_Motor.instance.UpdateMotor();
    }

    void GetLocomotionInput()
    {
        //gets WASD or arrow key information
        var deadZone = 0.1f;
        TP_Motor.instance.verticalVelocity = TP_Motor.instance.MoveVector.y;
        TP_Motor.instance.MoveVector = Vector3.zero;

        //ensure that the input exists outside of the dead zone
        if (Input.GetAxis("Vertical") > deadZone || Input.GetAxis("Vertical") < -deadZone)
        {
            TP_Motor.instance.MoveVector += new Vector3(0, 0, Input.GetAxis("Vertical"));
        }

        if (Input.GetAxis("Horizontal") > deadZone || Input.GetAxis("Horizontal") < -deadZone)
        {
            TP_Motor.instance.MoveVector += new Vector3(Input.GetAxis("Horizontal"), 0, 0);
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
		if (Input.GetKeyDown (KeyCode.N)) 
		{
			//Start/stop sliding
			if (TP_Motor.instance.isSliding){
				TP_Motor.instance.isSliding = false;
			} else if (!TP_Motor.instance.isSliding){
				TP_Motor.instance.isSliding = true;
			}
			Debug.Log((TP_Motor.instance.isSliding ? "Started" : "Stopped") + " sliding");
		}
        //Other actions will go here!
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
