using UnityEngine;
using System.Collections;

public class DuneRoamerController : MonoBehaviour {

	public NavMeshAgent navAgent;
	public GameObject player;
	private FSMSystem fsm;

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

	private void MakeFSM()
	{
		IdleDRState idle = new IdleDRState ();
		idle.AddTransition (Transition.PlayerAppears, StateID.ApproachStateID);

		ApproachDRState approach = new ApproachDRState ();
		approach.AddTransition (Transition.RollRange, StateID.RollStateID);
		approach.AddTransition (Transition.AttackRange, StateID.AttackStateID);

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
	//wandering to a point, 
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

}

public class RollDRState : FSMState
{
	
}

public class AttackDRState : FSMState
{
	
}

public class TrappedDRState : FSMState
{
	
}

public class StunnedDRState : FSMState
{
	
}

public class FallingDRState : FSMState
{
	
}