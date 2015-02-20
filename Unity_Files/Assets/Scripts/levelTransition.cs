using UnityEngine;
using System.Collections;

public class levelTransition : MonoBehaviour {

	private GameObject player;
	private Collider target;
	public int level;
	// Use this for initialization
	void Start () {
		player = GameObject.FindGameObjectWithTag ("Player");
		target = player.GetComponent<CharacterController>();
	}
	
	void OnTriggerEnter(Collider other) {
		if (other != target) //The colliding object isn't our object
		{
			//Debug.Log("something's wrong");
			return; //don't do anything if it's not our target
		}
		else {
			Application.LoadLevel(level);
		}
}
}
