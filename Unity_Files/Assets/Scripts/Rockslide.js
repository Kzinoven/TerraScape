#pragma strict

function OnTriggerEnter (other : Collider) {
	var target : GameObject = other.gameObject;
	var rb : Rigidbody = gameObject.GetComponent(Rigidbody);
	var speed : float = rb.velocity.magnitude;
	//do more damage to roamer
	if (target.tag.Equals("Roamer") && speed > 2){
		target.SendMessage("TakeDamage", 500);
	}else if (target.tag.Equals("Player" && speed > 2)){
		target.SendMessage("TakeDamage", 10);
	}
}