using UnityEngine;
using System.Collections;

public class DuneRoamerController : MonoBehaviour {

	public NavMeshAgent navAgent;
	public GameObject player;
	private FSMSystem fsm;

	public float attackDamage = 30.0f;
	
	public float walkSpeed = 3.5f;
	public float chargeSpeed = 10f;
	public float chaseWaitTime = 5.0f; //amount of time to wait when last known position is reached.
	float chaseTimer;
	
	public float rotationSpeed;
	
	public float fieldOfView = 200f;
	public float viewRange = 60f;
	public float attackRange = 7f;
	public float rollRange = 30f;
	
	Vector3 lastPlayerSighting;
	
	Rigidbody collider;
	public BoxCollider attackArea;
	
	public float MaxHealth = 1000f;
	public float currentHealth = 1000f;
	
	bool alive = true;
	
	public float rollSpeed = 15f;
	public float rollRotationSpeed = 5f;
	public float rollDamage = 70f;

	// Use this for initialization
	void Start () {
		navAgent = GetComponent<NavMeshAgent> ();
		player = GameObject.FindWithTag ("Player");
		MakeFSM ();
	}
	
	// Update is called once per frame
	void FixedUpdate () {
		fsm.CurrentState.Reason (player, gameObject);
		fsm.CurrentState.Act (player, gameObject);
	}

	public void SetTransition(Transition t) { fsm.PerformTransition(t); }

	private void MakeFSM()
	{
		IdleDRState idle = new IdleDRState ();
		idle.AddTransition (Transition.PlayerAppears, StateID.ApproachStateID);

		ApproachDRState approach = new ApproachDRState ();
		approach.AddTransition (Transition.RollRange, StateID.RollStateID);
		approach.AddTransition (Transition.AttackRange, StateID.AttackStateID);
		approach.AddTransition (Transition.OutOfRange, StateID.IdleStateID);

		RollDRState roll = new RollDRState ();
		roll.AddTransition (Transition.PlayerImpact, StateID.AttackStateID);
		roll.AddTransition (Transition.TrapImpact, StateID.TrappedStateID);
		roll.AddTransition (Transition.OtherImpact, StateID.StunnedStateID);
		roll.AddTransition (Transition.InAir, StateID.FallingStateID);

		AttackDRState attack = new AttackDRState ();
		attack.AddTransition (Transition.PlayerAppears, StateID.ApproachStateID);
		attack.AddTransition (Transition.RollRange, StateID.RollStateID);

		TrappedDRState trapped = new TrappedDRState ();
		trapped.AddTransition (Transition.BreakFree, StateID.IdleStateID);

		StunnedDRState stunned = new StunnedDRState ();
		stunned.AddTransition (Transition.BreakFree, StateID.IdleStateID);

		FallingDRState falling = new FallingDRState ();
		falling.AddTransition (Transition.Crash, StateID.IdleStateID);

		fsm = new FSMSystem ();
		fsm.AddState (idle);
		fsm.AddState (approach);
		fsm.AddState (roll);
		fsm.AddState (attack);
		fsm.AddState (trapped);
		fsm.AddState (stunned);
		fsm.AddState (falling);
	}
}

public class IdleDRState : FSMState
{
	public float wanderRange = 10f;
	public DuneRoamerController controller;

	//what the Dune roamer could be doing while idle: standing still,
	//wandering to a point, playing animation, etc.
	private enum IdleState
	{
		Idle = 0,
		Wander = 1
	}

	private IdleState state = IdleState.Idle;
	private Vector3 wanderPoint;

	//update timer for idle state - only change action once per second
	private float updatePeriod = 1f;
	private float timer = 0f;
	
	public override void Reason (GameObject player, GameObject npc)
	{
		if (Vector3.Distance(npc.transform.position, player.transform.position) < controller.viewRange)
		{
			controller.SetTransition(Transition.PlayerAppears);
		}
	}

	public override void Act (GameObject player, GameObject npc)
	{
		if ((timer += Time.deltaTime) >= updatePeriod)
		{
			timer = 0;
			if (state == IdleState.Idle)
			{
				float rand = Random.value;
				
				if (rand < 0.5)
				{
					state = IdleState.Idle;
				} else {
					state = IdleState.Wander;
					wanderPoint = controller.transform.position + new Vector3(Random.Range(-wanderRange, wanderRange),
					                                                          0,
					                                                          Random.Range(-wanderRange, wanderRange));
					controller.navAgent.SetDestination(wanderPoint);
				}
			}
		}
	}
}

public class ApproachDRState : FSMState
{
	public DuneRoamerController controller;

	public override void Reason (GameObject player, GameObject npc)
	{
		if (Vector3.Distance(npc.transform.position, player.transform.position) > controller.viewRange)
		{
			controller.SetTransition(Transition.OutOfRange);
		}
	}

	public override void Act (GameObject player, GameObject npc)
	{
		controller.navAgent.SetDestination (player.transform.position);
	}
}

public class RollDRState : FSMState
{
	public DuneRoamerController controller;
	public WheelCollider collider;

	private enum collisionTarget
	{
		None = 0,
		Player = 1,
		Trap = 2,
		Other = 3
	}

	private collisionTarget hitObject = collisionTarget.None;

	void OnCollisionEnter (Collision other)
	{
		if (other.gameObject.tag.Equals("Player"))
		{
			hitObject = collisionTarget.Player; 
		} else if (other.gameObject.tag.Equals("Trap"))
		{
			hitObject = collisionTarget.Trap;
		} else if (Vector3.Angle(controller.rigidbody.velocity, other.transform.position) < 30)
	  	{
			//get angle of velocity vector to position or collision - too large an angle means
			//the collision is with the ground, so don't do anything
			hitObject = collisionTarget.Other;
		}

	}

	public override void Reason (GameObject player, GameObject npc)
	{
		switch (hitObject)
		{
		case collisionTarget.Player:
			controller.SetTransition(Transition.PlayerImpact);
			break;

		case collisionTarget.Trap:
			controller.SetTransition(Transition.TrapImpact);
			break;

		case collisionTarget.Other:
			controller.SetTransition(Transition.OtherImpact);
			break;
		}
	}

	public override void Act (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}


}

public class AttackDRState : FSMState
{
	public DuneRoamerController controller;

	public override void Reason (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}

	public override void Act (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}
}

public class TrappedDRState : FSMState
{
	public DuneRoamerController controller;

	public override void Reason (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}
	
	public override void Act (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}
}

public class StunnedDRState : FSMState
{
	public DuneRoamerController controller;

	public override void Reason (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}
	
	public override void Act (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}
}

public class FallingDRState : FSMState
{
	public DuneRoamerController controller;

	public override void Reason (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}
	
	public override void Act (GameObject player, GameObject npc)
	{
		throw new System.NotImplementedException ();
	}
}