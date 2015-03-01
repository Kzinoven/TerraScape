using UnityEngine;
using System.Collections;

public class cinematicCamera : MonoBehaviour {
	public GameObject player;
	private Collider target;
	private Collider target2;
	private Transform cameraHolder;
	private Transform playerHolder;
	public int cutSceneNumber;
	public int time;
	private int timer;
	private bool timeStarted = false;
	public bool playerLock = true;
	public bool animated = false;

	// Use this for initialization
	void Start () {
		player = GameObject.Find("zenobia");
		cameraHolder = transform.GetChild (0);
		playerHolder = transform.GetChild (1);
		target = player.GetComponent<CharacterController>();
		target2 = player.GetComponent<CapsuleCollider> ();
	}

	void OnTriggerEnter(Collider other) {
		if (other != target && other != target2) //The colliding object isn't our object
		{
			Debug.Log("Wat is dis?");
			return; //don't do anything if it's not our target
		}
		else {
			Debug.Log("It should work");
			player.GetComponent<ThirdPersonController>().stopSliding();
			player.GetComponent<ThirdPersonController>().moveSpeed = 0.0f;
			player.GetComponent<ThirdPersonController>().verticalSpeed = 0.0f;
			player.GetComponent<ThirdPersonController>().inAirVelocity = Vector3.zero;
			Camera.main.transform.GetComponent<TP_Camera>().movable = false;
			Camera.main.transform.position = cameraHolder.transform.position;
			Camera.main.transform.rotation = cameraHolder.transform.rotation;
			timeStarted = true;
			if (playerLock){
				player.GetComponent<ThirdPersonController>().movable = false;
				player.transform.position = playerHolder.transform.position;
				player.transform.rotation = playerHolder.transform.rotation;
				player.GetComponent<ThirdPersonController>().cutScene = cutSceneNumber;
			}
			if (animated){
				cameraHolder.animation.Play();
				playerHolder.animation.Play();
			}
		}
	}
	// Update is called once per frame
	void Update () {
		if (animated && playerLock) {
			player.transform.position = playerHolder.transform.position;
			Camera.main.transform.position = cameraHolder.transform.position;
			player.transform.rotation = playerHolder.transform.rotation;
			Camera.main.transform.rotation = cameraHolder.transform.rotation;
		}
		else if (animated){
			Camera.main.transform.position = cameraHolder.transform.position;
			Camera.main.transform.rotation = cameraHolder.transform.rotation;
		}
		if (timeStarted){
			timer += 1;
		}
		if (timer >= time) {
			player.GetComponent<ThirdPersonController>().movable = true;
			Camera.main.transform.GetComponent<TP_Camera>().movable = true;
			player.GetComponent<ThirdPersonController>().cutScene = 0;
			Destroy (gameObject, 0);
		}
	}
}
