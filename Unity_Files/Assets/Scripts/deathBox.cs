using UnityEngine;
using System.Collections;

public class deathBox : MonoBehaviour {

	private GameObject player;
	private Collider target;
	
	// Use this for initialization
	void Start () {
		player = GameObject.Find("zenobia");
		target = player.GetComponent<CharacterController>();
	}
	
	void OnTriggerEnter(Collider other) {
		if (other != target) //The colliding object isn't our object
		{
			//Debug.Log("something's wrong");
			return; //don't do anything if it's not our target
		}
		else {
			//Application.LoadLevel(Application.loadedLevel);
			player.GetComponent<ThirdPersonController>().respawn();
		}
	}
}
