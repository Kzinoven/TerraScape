using UnityEngine;
using System.Collections;

public class checkPoint : MonoBehaviour {
	private GameObject player;
	private Collider target;
	private Transform placeHolder;
	// Use this for initialization
	void Start () {
		player = GameObject.Find("zenobia");
		placeHolder = transform.GetChild (0);
		target = player.GetComponent<CharacterController>();
	}
	
	// Update is called once per frame
	void OnTriggerEnter(Collider other) {
		if (other != target) //The colliding object isn't our object
		{
			Debug.Log("Wat is dis?");
			return; //don't do anything if it's not our target
		}
		else {
			Debug.Log("It should work");
			player.GetComponent<ThirdPersonController>().checkPoint = placeHolder;
			//Destroy (gameObject, 0);
		}
	}
}