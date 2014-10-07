using UnityEngine;
using System.Collections;

public class TP_Motor : MonoBehaviour 
{
    public static TP_Motor instance;
    public float moveSpeed = 10f;
    public Vector3 MoveVector { get; set; }

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

        //Factor in speed
        MoveVector *= moveSpeed;

        //Change from frames to seconds
        MoveVector *= Time.deltaTime;

        //Move character
        TP_Controller.characterController.Move(MoveVector);
    }
}
