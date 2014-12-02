using UnityEngine;
using System.Collections;

public class ShieldEnemyController : MonoBehaviour
{
	private GameObject player;
	//last known player location
	Vector3 lastPlayerLocation;
	float lastDist = 999;
	readonly float detectionRange = 40f;
	readonly float rollDistance = 20f;//closer than this - the creature does not roll towards player
	readonly float attackRange = 1f;//distance it can attack from
	readonly float attackDelay = 1.5f;//time between attacks
	float attackTimer = 0f;
	bool isRunning = false;//if the creature is running
	readonly float trapDuration = 5f;//how long the creature is trapped in a hole
	float trapTimer = 0f;

	private ShieldCreatureState currentState;
		
	// Use this for initialization
	void Awake ()
	{
		currentState = ShieldCreatureState.Idle;
        player = GameObject.FindGameObjectWithTag("Player");
	}
	
	// Update is called once per frame
	void Update ()
	{
		lastPlayerLocation = player.transform.position;
		float playerDist = Vector3.Distance (this.transform.position, lastPlayerLocation);

		switch (currentState) 
		{
		case ShieldCreatureState.Idle:
			//if the player is visible, roll or attack depending on distance
			if (isPlayerVisible())
			{
				if (playerDist >= rollDistance){
					currentState = ShieldCreatureState.Rolling;
				} else {
					currentState = ShieldCreatureState.Attacking;
				}
			}
			break;
		case ShieldCreatureState.Attacking:
			if (playerDist <= attackRange){
				isRunning = false;
				attackTimer += Time.deltaTime;
				if (attackTimer >= attackDelay){
					//attack the player
					attackTimer = 0;
					//shield animator/motor attack
				}
			} else if (playerDist < rollDistance / 5 && !isRunning){
				//walk towards player
				//shield animator/motor walk
			} else {
				isRunning = true;
				//run towards player
				//shield animator/motor run
			}
			break;
		case ShieldCreatureState.Rolling:
			//check if distance in previous frame is less than in current frame (moving away from player)
			if (lastDist < playerDist && playerDist >= 6){
				currentState = ShieldCreatureState.Attacking;
				//stop rolling
			} else {
				lastDist = playerDist;
				//shield animator/motor roll
			}
			break;
		case ShieldCreatureState.Trapped:
			trapTimer += Time.deltaTime;
			if (trapTimer >= trapDuration){
				currentState = ShieldCreatureState.Idle;
				//play escape animation
			} else {
				//play struggle animation
			}
			break;
		}
		//GUI_Manager.enemyState.text = "Enemy AI State: " + currentState.toString();
	}

	public ShieldCreatureState getState()
	{
		return currentState;
	}

	private void onTriggerEnter(Collider collider)
	{
		if (currentState == ShieldCreatureState.Rolling) 
		{
			if (collider.gameObject.tag == "Player")
			{
				//deal heavy blow to player and stop rolling
			} else if (collider.gameObject.tag == "Pit")
			{
				currentState = ShieldCreatureState.Trapped;
				//play trapped animation
			}
		}
	}

	private bool isPlayerVisible()
	{
		return Vector3.Distance (this.transform.position, player.transform.position) < detectionRange;
	}
}

