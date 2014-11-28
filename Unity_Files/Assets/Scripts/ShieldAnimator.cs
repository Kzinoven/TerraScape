using UnityEngine;
using System.Collections;

public class ShieldAnimator : MonoBehaviour
{
	//the animation the creature is currently in
	enum ActionState
	{
		Idle,
		Walking,
		Running,
		Rolling,
		Attacking,
		Struggling
	}
	
	private ActionState currentState;
	private ShieldCreatureState controllerState;

	private ShieldEnemyController controller;

	// Use this for initialization
	void Awake ()
	{
		controller = GetComponent<ShieldEnemyController> ();
		controllerState = controller.getState();
		currentState = ActionState.Idle;
	}
	
	// Update is called once per frame
	void Update ()
	{
		controllerState = controller.getState ();
		currentState = ActionState.Idle;
		//set gui manager to action state
		//GUI_Manager.creatureAnimation.text = "Enemy Animation State: " + currentState.toString();
	}

	public void Idle()
	{
		//play idle animation
	}

	public void Walk()
	{

		transform.FindChild("shieldCreature_inProgress_v5_unsmoothed_walk").animation.CrossFade("Walk");
	}

	public void Run()
	{
		//play run animation
	}

	public void Roll()
	{
		//play roll animation
	}

	public void Attack()
	{
		//play attack animation
	}

	public void Struggle()
	{
		//play struggle animation
	}
}

