using UnityEngine;
using System.Collections;

public class BasicEnemyAI : MonoBehaviour {
	static GameObject Player;

	public float attackSpeed = 1.0f;
	float attackCooldown;
	float attackTimer = 0;
	public float attackDamage = 5.0f;

	public float wanderSpeed = 2.0f;
	public float chaseSpeed = 5.0f;
	public float chaseWaitTime = 5.0f; //amount of time to wait when last known position is reached.
	float chaseTimer;

	public float rotationSpeed;
	private Quaternion _lookRotation;
	private Vector3 _direction;

	public float fieldOfView = 200f;
	public float viewRange = 20f;
	public float attackRange = 4f;
	
	Vector3 lastPlayerSighting;

	Rigidbody collider;
	BoxCollider attackArea;

	public float MaxHealth = 1000f;
	public float currentHealth = 1000f;

	bool alive = true;

	// Use this for initialization
	void Start () {
		Player = GameObject.FindWithTag ("Player");
		attackCooldown = 1.0f / attackSpeed;
		chaseTimer = chaseWaitTime;
		collider = GetComponent<Rigidbody> ();
		attackArea = GetComponent<BoxCollider> ();

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
				Attack ();
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
			Player.SendMessage("TakeDamage", attackDamage);
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
			collider.MovePosition (transform.position + _direction * chaseSpeed * Time.deltaTime);
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
