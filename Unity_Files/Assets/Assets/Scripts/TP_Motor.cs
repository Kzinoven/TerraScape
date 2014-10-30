using UnityEngine;
using System.Collections;

public class TP_Motor : MonoBehaviour 
{
    public static TP_Motor instance;

    public float forwardSpeed = 10f;
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
        instance = this;
    }

    public void UpdateMotor()
    {
        AlignCharacterWithCamera();
        ProcessMotion();
    }

    void AlignCharacterWithCamera()
    {
        //Snaps the character to face away from the main camera
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
        var moveSpeed = 0f;

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

        if (isSliding)
        {
            moveSpeed = slideSpeed;
        }

        return moveSpeed;
    }

    void ApplyGravity()
    {
        if (MoveVector.y > -terminalVelocity)
        {
            MoveVector = new Vector3(MoveVector.x, (MoveVector.y - gravity * Time.deltaTime), MoveVector.z);
        }

        if (TP_Controller.characterController.isGrounded && MoveVector.y < -1)
        {
            MoveVector = new Vector3(MoveVector.x, -1, MoveVector.z);
        }
    }

    void ApplySlide()
    {
        if (!TP_Controller.characterController.isGrounded)
        {
            return;
        }

        slideDirection = Vector3.zero;

        RaycastHit hitInfo;
        if (Physics.Raycast(transform.position/*+ Vector3.up (adjust for ground clipping later)*/, Vector3.down, out hitInfo))
        {
            if (hitInfo.normal.y < slideThreshold)
            {
                slideDirection = new Vector3(hitInfo.normal.x, -hitInfo.normal.y, hitInfo.normal.z);
                if (!isSliding)
                {
                    TP_Animator.instance.Slide();
                }
                isSliding = true;
            }
            else
            {
                isSliding = false;
            }
        }

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
        if (TP_Controller.characterController.isGrounded)
        {
            verticalVelocity = jumpSpeed;
        }
    }
}
