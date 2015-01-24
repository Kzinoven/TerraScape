using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Animator))]
public class TP_Animator : MonoBehaviour
{
    //Handles all the animation and defines "Action States" for the player character
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
        ClimbLedge,
        ClimbVine,
        Slide,
        Interact,
        CollectItem,
        Shovel,
        Snapper,
        Shield,
        ShieldSlide,
        TakeDamage,
        Dead,
        ActionLocked,
    }

    public static TP_Animator instance;

    private Animation characterAnimations;

    private ActionState lastState;
    private Transform climbPoint;

    private Animator anim;
    private AnimatorStateInfo currentBaseState;

    public Vector3 climbOffset = Vector3.zero;
    public Vector3 postClimbOffset = Vector3.zero;
    public float climbJumpStartTime = 0f;
    public float climbAnchorTime = 0.6f;

    private Transform pelvis;

    public Direction moveDirection { get; set; }
    public ActionState currentState { get; set; }
    public bool isDead { get; set; }

    #endregion

    #region Determining Functions
    void Awake()
    {
        //on activation
        instance = this;
        pelvis = transform.FindChild("RootJnt") as Transform;
        characterAnimations = transform.FindChild("a_zenobia_walk").animation;
    }

    void Update()
    {
        //every frame, determine which actionState is to be used, and call its function
        DetermineCurrentActionState();
        ProcessCurrentState();
       // GUI_Manager.charState.text = "Character State: " + currentState.ToString();
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
        //Figure out which ActionState to use in this frame
        if (currentState == ActionState.Dead)
        {
            //Do nothing if the player is Dead
            return;
        }
        if (!TP_Controller.characterController.isGrounded)
        {
            if (currentState != ActionState.Fall && 
                currentState != ActionState.Jump && 
                currentState != ActionState.Land)
            {
                //Fall if we are not grounded and not already in a state
                Fall();
            }
        }

        //Rule out all states that don't have to do with lateral motion
        if (currentState != ActionState.Fall && 
            currentState != ActionState.Jump && 
            currentState != ActionState.Land &&
            currentState != ActionState.Interact && 
            currentState != ActionState.ClimbLedge &&
            currentState != ActionState.ClimbVine &&
            currentState != ActionState.CollectItem &&
            currentState != ActionState.Snapper && 
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
        //Call the helper method for each ActionState
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
            case ActionState.ClimbLedge:
                Climbing();
                break;
            case ActionState.Dead:
                break;
            case ActionState.TakeDamage:
                break;
            case ActionState.Shovel:
                break;
            case ActionState.Snapper:
                break;
            case ActionState.Shield:
                break;
            case ActionState.ActionLocked:
                break;
        }
        //this will be finished later
    }

    #region Action State Methods
    //Just skeletons for now - these are responsible for playing the actual animations
    void Idle()
    {
        //crossfade the idle animation
        characterAnimations.Stop();
    }

    void Walking()
    {
        //crossfade the walking animation
        characterAnimations.CrossFade("Walk");
    }

    void Running()
    {
        //crossfade the running animation
    }

    void Interacting()
    {
        if (!characterAnimations.isPlaying)
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

    void Climbing()
    {
        if (animation.isPlaying)
        {
            var time = animation["Climbing"].time;
            if (time > climbJumpStartTime && time < climbAnchorTime)
            {
                transform.rotation = Quaternion.Euler(transform.rotation.eulerAngles.x,
                                                      Mathf.Lerp(transform.rotation.eulerAngles.y, 
                                                      climbPoint.rotation.eulerAngles.y, 
                                                      (time - climbJumpStartTime) / (climbAnchorTime - climbJumpStartTime)), 
                                                      transform.rotation.eulerAngles.z);

                var climbOffset = transform.TransformDirection(this.climbOffset);

                transform.position = Vector3.Lerp(transform.position, 
                                                  new Vector3(climbPoint.position.x, 
                                                  transform.position.y, 
                                                  climbPoint.position.z) + climbOffset, 
                                                  (time - climbJumpStartTime) / (climbAnchorTime - climbJumpStartTime));
            }
        }
        else
        {
            currentState = ActionState.Idle;
            //play the Idle animation
            var postClimbOffset = transform.TransformDirection(this.postClimbOffset);
            transform.position = new Vector3(pelvis.position.x, (climbPoint.position.y + climbPoint.localScale.y) / 2, pelvis.position.z) + postClimbOffset;
        }
    }

    #endregion

    #region Start Action Methods
    //For ActionStates which need to be "activated" or called from the outside
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

    public void Climb()
    {
        if (!TP_Controller.characterController.isGrounded || isDead || climbPoint == null)
        {
            return;
        }
        if (Mathf.Abs(climbPoint.rotation.eulerAngles.y - transform.rotation.eulerAngles.y) > 60)
        {
            TP_Controller.instance.Jump();
            return;
        }

        currentState = ActionState.ClimbLedge;
    }

    #endregion

    public void SetClimbPoint(Transform climbPoint)
    {
        this.climbPoint = climbPoint;
        TP_Controller.instance.climbEnabled = true;
    }

    public void ClearClimbPoint(Transform climbPoint)
    {
        if (this.climbPoint == climbPoint)
        {
            this.climbPoint = null;
            TP_Controller.instance.climbEnabled = false;
        }
    }
}
