using UnityEngine;
using System.Collections;

public class TP_Animator : MonoBehaviour
{
    public enum Direction
    {
        Stationary,
        Forward,
        Backward,
        Left,
        Right,
        LeftForward,
        RightForward,
        LeftBackward,
        RightBackward,
    }

    public static TP_Animator instance;

    public Direction moveDirection;

    void Awake()
    {
        instance = this;
    }

    public void DetermineCurrentMoveDirection()
    {
        var forward = false;
        var backward = false;
        var left = false;
        var right = false;

        if (TP_Motor.instance.MoveVector.z > 0)
            forward = true;
        if (TP_Motor.instance.MoveVector.z < 0)
            backward = true;
        if (TP_Motor.instance.MoveVector.x > 0)
            right = true;
        if (TP_Motor.instance.MoveVector.x < 0)
            left = true;

        if (forward)
        {
            if (left)
                moveDirection = Direction.LeftForward;
            else if (right)
                moveDirection = Direction.RightForward;
            else
                moveDirection = Direction.Forward;
        }
        else if (backward)
        {
            if (left)
                moveDirection = Direction.LeftBackward;
            else if (right)
                moveDirection = Direction.RightBackward;
            else
                moveDirection = Direction.Backward;
        }
        else if (left)
            moveDirection = Direction.Left;
        else if (right)
            moveDirection = Direction.Right;
        else
            moveDirection = Direction.Stationary;
    }
}
