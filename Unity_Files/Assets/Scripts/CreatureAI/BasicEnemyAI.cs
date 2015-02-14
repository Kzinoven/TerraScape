using UnityEngine;
using System.Collections;

public class BasicEnemyAI : MonoBehaviour {
	static ThirdPersonController Player;

	public float attackSpeed = 0.3f;//attacks per second
	float attackCooldown;
	float attackTimer = 0;
	public float attackDamage = 30.0f;

	public float walkSpeed = 3.5f;
	public float chargeSpeed = 10f;
	public float chaseWaitTime = 5.0f; //amount of time to wait when last known position is reached.
	float chaseTimer;

	public float rotationSpeed;
	private Quaternion _lookRotation;
	private Vector3 _direction;

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
	void Awake () {
		Player = GameObject.FindWithTag ("Player").GetComponent<ThirdPersonController>();
		attackCooldown = 1.0f / attackSpeed;
		chaseTimer = chaseWaitTime;
		collider = GetComponent<Rigidbody> ();
	}
	
	// Update is called once per frame
	void Update () {

		if (!alive) {
			return;
		}
		attackTimer += Time.deltaTime;
		if (playerVisible()) {
			//if the player is within attack range
			if (attackArea.bounds.Contains(Player.transform.position)) {
				Attack();
			}
			lastPlayerSighting = Player.transform.position;
			chaseTimer = 0;
		}
		if (chaseTimer < chaseWaitTime) {
			//go to last known location
			Chase();
		}
		else {
			Wander();
		}

	}

	public void TakeDamage(float dmgAmt)
	{
		//Reduces our current health and updates game information
		currentHealth -= dmgAmt;
		
		if (currentHealth <= 0 && alive)
		{
			Die();
			alive = false;
		}
	}

	private void Die()
	{
		alive = false;
		//set color of dune roamer to red
		Debug.Log ("Creature Dead");
	}
	
	float DistanceFromPlayer(){
		return Vector3.Distance (Player.transform.position, transform.position);
	}

	//check if player is visible using enemy FOV and viewRange, possibly use raycasting/hiding behind obstacles in a future update
	bool playerVisible(){
		return DistanceFromPlayer() <= viewRange;
	}

	//use attackTimer to regulate attack speed
	void Attack(){

		if (attackTimer >= attackCooldown) {
			//play attack animation
			Player.takeAttack(transform.position, attackDamage);
			attackTimer = 0f;
		}
	}

	void Wander(){

	}

	//move towards player's last known position
	void Chase(){
		//we don't want the enemy to move directly in the y direction, so set last known positions y to this object's y
		Vector3 destination = new Vector3 (lastPlayerSighting.x, transform.position.y, lastPlayerSighting.z);

		_direction = (destination - transform.position).normalized;
		_lookRotation = Quaternion.LookRotation(_direction);

		//move and turn towards last known player position.
		collider.MoveRotation (_lookRotation);

		// If near the last  sighting...
		if(Vector3.Distance(transform.position, destination) < attackRange - 0.5)
		{
			// ... increment the timer, waiting at that spot until player is detected or timer runs out.
			chaseTimer += Time.deltaTime;
		}
		else {
			//only move if not near the player/sighting
			collider.MovePosition (transform.position + _direction * chargeSpeed * Time.deltaTime);
		}
	}

	void OnTriggerEnter(Collider other){
		//if rolling
		if (other.gameObject.tag.Equals("FaultLine")){
			other.gameObject.SendMessage ("Break");//send message to break rocks
		}
		//attack the player if
	}
}
