using UnityEngine;
using System.Collections;

public class TP_Animator : MonoBehaviour
{

    #region Variables
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

    private ActionState lastState;

    public Direction moveDirection { get; set; }
    public ActionState currentState { get; set; }
    public bool isDead { get; set; }

    #endregion

    #region Determining Functions
    void Awake()
    {
        instance = this;
    }

    void Update()
    {
        DetermineCurrentActionState();
        ProcessCurrentState();
        GUI_Manager.charState.text = "Character State: " + currentState.ToString();
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
                Fall();
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
            currentState != ActionState.TakeDamage)
        {
            if (moveDirection != Direction.Stationary)
            {
                //are we walking, sliding, or running?  Assume walking
                currentState = ActionState.Walk;
            }
            else
            {
                currentState = ActionState.Idle;
            }
        }
    }

    #endregion

    void ProcessCurrentState()
    {
        switch (currentState)
        {
            case ActionState.Idle:
                Idle();
                break;
            case ActionState.Walk:
                Walking();
                break;
            case ActionState.Run:
                Running();
                break;
            case ActionState.Jump:
                Jumping();
                break;
            case ActionState.Fall:
                Falling();
                break;
            case ActionState.Land:
                Landing();
                break;
            case ActionState.Interact:
                Interacting();
                break;
            case ActionState.CollectItem:
                Interacting();
                break;
            case ActionState.Slide:
                Sliding();
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

    #region Action State Methods
    void Idle()
    {
        //crossfade the idle animation
    }

    void Walking()
    {
        //crossfade the walking animation
    }

    void Running()
    {
        //crossfade the running animation
    }

    void Interacting()
    {
        if (/*!animation.isPlaying*/true)
        {
            currentState = ActionState.Idle;
            Idle();
        }    
    }

    void Jumping()
    {
        //make sure we are on the ground and play the proper Landing animation
        if (/*(!animation.isPlaying && TP_Controller.characterController.isGrounded)
            || */TP_Controller.characterController.isGrounded)
        {
            if (lastState == ActionState.Run)
            {
                //crossfade the Running Land animation
            }
            else
            {
                //crossfade the Landing animation
            }
            currentState = ActionState.Land;
        }
        else if(/*!animation.IsPlaying("Jump")*/ true)
        {
            currentState = ActionState.Fall;
            //crossfade the Falling animation
        }
        else
        {
            currentState = ActionState.Jump;
            // Determine if we fell too far
        }
    }

    void Falling()
    {
        if (TP_Controller.characterController.isGrounded)
        {
            if (lastState == ActionState.Run)
            {
                //crossfade the Running Land animation
            }
            else
            {
                //crossfade the Landing animation
            }
            currentState = ActionState.Land;
        }
    }

    void Landing()
    {
        if (lastState == ActionState.Run)
        {
            if (/*!animation.IsPlaying("RunLand")*/ true)
            {
                currentState = ActionState.Run;
                //Play the Running animation
            }
        }
        else
        {
            if (/*!animation.IsPlaying("JumpLand")*/ true)
            {
                currentState = ActionState.Idle;
                //Play the Idle animation
            }
        }
    }

    void Sliding()
    {
        if (!TP_Motor.instance.isSliding)
        {
            currentState = ActionState.Idle;
            Idle();
        }
    }

    #endregion

    #region Start Action Methods

    public void Interact(bool hasItem)
    {
        if (hasItem)
        {
            currentState = ActionState.CollectItem;
            //crossfade the CollectItem animation
        }
        else
        {
            currentState = ActionState.Interact;
            //crossfade the Interacting animation
        }
    }

    public void Jump()
    {
        if (!TP_Controller.characterController.isGrounded || isDead || currentState == ActionState.Jump)
        {
            return;
        }
        lastState = currentState;
        currentState = ActionState.Jump;
        //crossfade the Jumping animation
    }

    public void Fall()
    {
        if (isDead)
            return;

        lastState = currentState;
        currentState = ActionState.Fall;
        //check how far we are falling
        //crossfade the Falling animation
    }

    public void Slide()
    {
        currentState = ActionState.Slide;
        //crossfade the Sliding animation depending on whether or not the Shield is equipped
    }

    #endregion
}
