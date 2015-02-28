using UnityEngine;
using System.Collections;

public class TP_Motor : MonoBehaviour 
{
    //The TP_Motor class handles all of the actual movement in world-space that the character controller does.

    //static instance of this class, so we won't have extraneous TP_Motors
    public static TP_Motor instance;

    //public vars which determine speed and forces
    public float forwardSpeed = 10f;
	public float sprintSpeed = 15f;
    public float backwardSpeed = 8f;
    public float strafingSpeed = 6f;
    public float slideSpeed = 10f;
    public float jumpSpeed = 6f;
    public float gravity = 21f;
    public float terminalVelocity = 20f;

    public float slideThreshold = 0.8f;
    public float maxControllableSlideMagnitude = 0.4f;
    private Vector3 slideDirection;

    public Vector3 MoveVector { get; set; }
    public float verticalVelocity { get; set; }
    public bool isSliding { get; set; }

    void Awake()
    {
        //On creation, set the instance to THIS instance of TP_Motor
        instance = this;
    }

    public void UpdateMotor()
    {
        //gets called every frame in TP_Controller
        AlignCharacterWithCamera();
		if (!isSliding)
		{
        	ProcessMotion();
		}
    }

	public void FixedUpdate()
	{
		if (isSliding)
		{
			ApplyGravity();
			TP_Controller.characterController.Move(MoveVector * Time.deltaTime);
		}
	}

    void AlignCharacterWithCamera()
    {
        //Snaps the character to face away from the main camera, may be changed in future versions.
        if (MoveVector.x != 0 || MoveVector.z != 0)
        {
            transform.rotation = Quaternion.Euler(transform.eulerAngles.x, Camera.main.transform.eulerAngles.y, transform.eulerAngles.z);
        }
    }

    void ProcessMotion()
    {
        //Translate MoveVector into world-space coords
        MoveVector = transform.TransformDirection(MoveVector);

        //Normalise MoveVector if magnitude > 1
        if (MoveVector.magnitude > 1)
        {
            MoveVector = Vector3.Normalize(MoveVector);
        }

        //Apply sliding
        ApplySlide();

        //Factor in speed forward, backward, or sideways
        MoveVector *= CalculateMoveSpeed();

        //Reapply vertical velocity to MoveVector.y
        MoveVector = new Vector3(MoveVector.x, verticalVelocity, MoveVector.z);
        ApplyGravity();

        //Move character
        TP_Controller.characterController.Move(MoveVector * Time.deltaTime);
    }

    float CalculateMoveSpeed()
    {
        //Start at zero
        var moveSpeed = 0f;

        //Look at the direction we are moving in TP_Animator and then adjust moveSpeed
        switch (TP_Animator.instance.moveDirection)
        {
            case TP_Animator.Direction.Stationary:
                moveSpeed = 0f;
                break;
            case TP_Animator.Direction.Forward:
                moveSpeed = forwardSpeed;
                break;
            case TP_Animator.Direction.Backward:
                moveSpeed = backwardSpeed;
                break;
            case TP_Animator.Direction.Left:
                moveSpeed = strafingSpeed;
                break;
            case TP_Animator.Direction.Right:
                moveSpeed = strafingSpeed;
                break;
            case TP_Animator.Direction.LeftForward:
                moveSpeed = forwardSpeed;
                break;
            case TP_Animator.Direction.RightForward:
                moveSpeed = forwardSpeed;
                break;
            case TP_Animator.Direction.LeftBackward:
                moveSpeed = backwardSpeed;
                break;
            case TP_Animator.Direction.RightBackward:
                moveSpeed = backwardSpeed;
                break;
        }

        //Check to see if we are sliding
        if (isSliding)
        {
            moveSpeed = slideSpeed;
        }

        return moveSpeed;
    }

    void ApplyGravity()
    {
        //Sets the force that gravity will have on the character controller

        //Make sure that we are not exceeding terminal velocity
        if (MoveVector.y > -terminalVelocity)
        {
            MoveVector = new Vector3(MoveVector.x, (MoveVector.y - gravity * Time.deltaTime), MoveVector.z);
        }

        //When we are on the ground, make sure that the downward force does not exceed 1
        if (TP_Controller.characterController.isGrounded && MoveVector.y < -1)
        {
            MoveVector = new Vector3(MoveVector.x, -1, MoveVector.z);
        }
    }

    void ApplySlide()
    {
        //Applies sliding motion to the basic move vector

        //Do nothing if we are in the air
        if (!TP_Controller.characterController.isGrounded)
        {
            return;
        }

        //Zero out our slideDirection vector
        slideDirection = Vector3.zero;

        //Make a raycast straight downward
        RaycastHit hitInfo;
        //Check that the raycast hits a target
        if (Physics.Raycast(transform.position/*+ Vector3.up (adjust for ground clipping later)*/, Vector3.down, out hitInfo))
        {
            //If the normal of the polygon found by the raycast exceeds our threshold...
            if (hitInfo.normal.y < slideThreshold)
            {
                //then set our slide vector to match
                slideDirection = new Vector3(hitInfo.normal.x, -hitInfo.normal.y, hitInfo.normal.z);
                if (!isSliding)
                {
                    //play the Sliding animation in TP_Animator
                    TP_Animator.instance.Slide();
                }
                isSliding = true;
            }
            else
            {
                isSliding = false;
            }
        }

        //Check to see if we are allowed to control the slide and adjust accordingly
        if (slideDirection.magnitude < maxControllableSlideMagnitude)
        {
            MoveVector += slideDirection;
        }
        else
        {
            MoveVector = slideDirection;
        }
    }
    public void Jump()
    {
        //Jump, as long as we are on the ground
        if (TP_Controller.characterController.isGrounded)

        {
            verticalVelocity = jumpSpeed;
        }
    }
	//THIS IS TEMPORARY TO SIMULATE CLIMBING
	public void OnTriggerStay()
	{
		//if (collider.gameObject.tag == "Climbable"){
		//print ("climbing");
		MoveVector = new Vector3(0, 2, 0);
		//}
		// if (collider.gameObject.tag == "Ledge"){
		//	MoveVector = new Vector3(0, 0, 0);
		//}

	}
}
