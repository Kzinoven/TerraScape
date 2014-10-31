using UnityEngine;
using System.Collections;

public class TP_Controller : MonoBehaviour 
{
    public static CharacterController characterController;
    public static TP_Controller instance;

    public GameItem interactingItem = null;
    public GameObject activeHotspot = null;

    void Awake()
    {
        characterController = GetComponent("CharacterController") as CharacterController;
        instance = this;
        TP_Camera.EstablishMainCamera();
    }

    void Update()
    {
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

        if (Input.GetKeyDown(KeyCode.Z))
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

    void Jump()
    {
        TP_Animator.instance.Jump();
        TP_Motor.instance.Jump();
    }

    void OnTriggerEnter(Collider collider)
    {
        //Collided with a trigger!
        if (collider.gameObject.tag == "Item")
        {
            interactingItem = collider.gameObject.GetComponent<GameItem>();
        }
        else if (collider.gameObject.tag == "ShovelSpot")
        {
            activeHotspot = collider.gameObject;
        }
    }

    void OnTriggerExit(Collider collider)
    {
        //Stopped colliding with a trigger!
        if (collider.gameObject.tag == "Item")
        {
            interactingItem = null;
        }
        else if (collider.gameObject.tag == "ShovelSpot")
        {
            activeHotspot = null;
        }
    }
}
