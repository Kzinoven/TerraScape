using UnityEngine;
using System.Collections;

public class TP_Controller : MonoBehaviour 
{
    public static CharacterController characterController;
    public static TP_Controller instance;

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

        //Other actions will go here!
    }

    void Jump()
    {
        //Play Jumping animation

        TP_Motor.instance.Jump();
    }
}
