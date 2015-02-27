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

	public DuneRoamerHit hitObject;

	// Use this for initialization
	void Start () {
		navAgent = GetComponent<NavMeshAgent> ();
		player = GameObject.FindWithTag ("Player");
		MakeFSM ();
		hitObject = DuneRoamerHit.None;
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
		roll.AddTransition (Transition.PlayerImpact, StateID.ApproachStateID);
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

	void OnCollisionEnter (Collision other)
	{
		if (other.gameObject.tag.Equals("Player"))
		{
			hitObject = DuneRoamerHit.Player;
		} else if (other.gameObject.tag.Equals("Trap"))
		{
			hitObject = DuneRoamerHit.Trap;
		}
	}

	public void takeDamage (float dmg)
	{
		if (dmg > currentHealth)
		{
			currentHealth = 0;
			//die
		} else
		{
			currentHealth -= dmg;
		}
	}
}

public enum DuneRoamerHit
{
	None = 0,
	Player = 1,
	Trap = 2
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
		} else if (Vector3.Distance(npc.transform.position, player.transform.position) < controller.rollRange - 5f &&
		           Vector3.Angle(npc.transform.TransformDirection(Vector3.forward),player.transform.position) < 5f)
		{
			controller.SetTransition(Transition.RollRange);
		} else if (Vector3.Distance(npc.transform.position, player.transform.position) < controller.attackRange - 3f &&
		           Vector3.Angle(npc.transform.TransformDirection(Vector3.forward),player.transform.position) < 5f)
		{
			controller.SetTransition(Transition.AttackRange);
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
	private float lastFrameSpeed;

	public override void Reason (GameObject player, GameObject npc)
	{
		switch (controller.hitObject)
		{
		case DuneRoamerHit.Player:
			controller.SetTransition(Transition.PlayerImpact);
			return;

		case DuneRoamerHit.Trap:
			controller.SetTransition(Transition.TrapImpact);
			return;
		}

		//if the dune roamer has slowed down a lot last frame, then it's hit something
		if (lastFrameSpeed - controller.rigidbody.velocity.magnitude > controller.rollSpeed * 0.75)
		{
			controller.SetTransition(Transition.OtherImpact);
			return;
		}

		//if vertical velocity is above a certain threshold, start falling
		if (controller.rigidbody.velocity.y < -10f)
		{
			controller.SetTransition(Transition.InAir);
			return;
		}
	}

	public override void Act (GameObject player, GameObject npc)
	{
		//play rolling animation

		controller.rigidbody.AddRelativeForce (Vector3.forward * 1000);
		if (controller.rigidbody.velocity.sqrMagnitude > controller.rollSpeed * controller.rollSpeed)
		{
			controller.rigidbody.velocity = controller.rigidbody.velocity.normalized * controller.rollSpeed;
		}
		lastFrameSpeed = controller.rigidbody.velocity.magnitude;
	}


}

public class AttackDRState : FSMState
{
	public DuneRoamerController controller;
	private Vector3 target;

	public override void DoBeforeEntering ()
	{
		Ray chargePath = new Ray (controller.transform.position, controller.player.transform.position);
		target = chargePath.GetPoint (Vector3.Distance (controller.transform.position, controller.player.transform.position)
						+ 10f);
	}
	public override void Reason (GameObject player, GameObject npc)
	{

	}

	public override void Act (GameObject player, GameObject npc)
	{
		//[ANIMATE] play charging animation
		controller.navAgent.SetDestination(target);
	}
}

public class TrappedDRState : FSMState
{
	public DuneRoamerController controller;
	private float trapDuration = 10f;
	private float trapTimer = 0f;
	
	public override void Reason (GameObject player, GameObject npc)
	{
		if (trapTimer >= trapDuration) 
		{
			controller.SetTransition(Transition.BreakFree);
			trapTimer = 0;
		}
	}
	
	public override void Act (GameObject player, GameObject npc)
	{
		//play stunned animation
		trapTimer += Time.deltaTime;
	}
}

public class StunnedDRState : FSMState
{
	public DuneRoamerController controller;
	private float stunDuration = 5f;
	private float stunTimer = 0f;

	public override void Reason (GameObject player, GameObject npc)
	{
		if (stunTimer >= stunDuration) 
		{
			controller.SetTransition(Transition.BreakFree);
			stunTimer = 0;
		}
	}
	
	public override void Act (GameObject player, GameObject npc)
	{
		//play stunned animation
		stunTimer += Time.deltaTime;
	}
}

public class FallingDRState : FSMState
{
	public DuneRoamerController controller;
	private float fallingSpeed;

	public override void Reason (GameObject player, GameObject npc)
	{
		//if the dune roamer has stopped falling, it's hit the ground
		if (controller.rigidbody.velocity.y == 0)
		{
			//take damage only if falling speed over threshold
			controller.takeDamage(Mathf.Clamp(fallingSpeed - 5f, 0, float.PositiveInfinity) * 20);
			controller.SetTransition(Transition.Crash);
		}
	}
	
	public override void Act (GameObject player, GameObject npc)
	{
		//play falling animation
		fallingSpeed = controller.rigidbody.velocity.y;
	}
}