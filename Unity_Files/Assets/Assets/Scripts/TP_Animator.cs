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

    public enum ActionState
    {
        Idle,
        Walk,
        Run,
        Jump,
        Fall,
        Land,
        Climb,
        Slide,
        Interact,
        CollectItem,
        Shovel,
        SetClaw,
        Shield,
        TakeDamage,
        Dead,
        ActionLocked,
    }

    public static TP_Animator instance;

    public Direction moveDirection { get; set; }
    public ActionState currentState { get; set; }

    void Awake()
    {
        instance = this;
    }

    void Update()
    {
        DetermineCurrentActionState();
        ProcessCurrentState();
        //Debug.Log("Current action state: " + currentState.ToString());
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

    void DetermineCurrentActionState()
    {
        if (currentState == ActionState.Dead)
        {
            return;
        }
        if (!TP_Controller.characterController.isGrounded)
        {
            if (currentState != ActionState.Fall && 
                currentState != ActionState.Jump && 
                currentState != ActionState.Land)
            {
                //Start falling at this point
            }
        }

        //Rule out all states that don't have to do with lateral motion
        if (currentState != ActionState.Fall && 
            currentState != ActionState.Jump && 
            currentState != ActionState.Land &&
            currentState != ActionState.Interact && 
            currentState != ActionState.Climb &&
            currentState != ActionState.CollectItem &&
            currentState != ActionState.SetClaw && 
            currentState != ActionState.Shield && 
            currentState != ActionState.Shovel &&
            currentState != ActionState.Slide &&
            currentState != ActionState.TakeDamage)
        {
            //determine whether idle, walking, or running
        }
    }

    void ProcessCurrentState()
    {
        switch (currentState)
        {
            case ActionState.Idle:
                Idle();
                break;
            case ActionState.Walk:
                break;
            case ActionState.Run:
                break;
            case ActionState.Jump:
                break;
            case ActionState.Fall:
                break;
            case ActionState.Land:
                break;
            case ActionState.Interact:
                break;
            case ActionState.CollectItem:
                break;
            case ActionState.Climb:
                break;
            case ActionState.Dead:
                break;
            case ActionState.TakeDamage:
                break;
            case ActionState.Shovel:
                break;
            case ActionState.SetClaw:
                break;
            case ActionState.Shield:
                break;
            case ActionState.ActionLocked:
                break;
        }
    }

    void Idle()
    {
        //play the idle animation
    }
}
