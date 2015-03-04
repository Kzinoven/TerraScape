using UnityEngine;
using System.Collections;

public class grabbableLedge : MonoBehaviour {
	private GameObject player;
	private Collider target;
	private float lerpTime = 200.0f;
	public float charHeight = 0.5f;
	public float clingDistance = 0.0f;
	private Vector3 startPos;
	private Vector3 endPos;
	private Quaternion startRot;
	private Quaternion endRot;
	private Vector3 playerMeshPos;
	private Transform playerMesh;
	private Vector3 shiftPlayer;
	// Use this for initialization
	void Start () {
		player = GameObject.Find("zenobia");
		playerMesh = player.transform.GetChild (0);
		target = player.GetComponent<CharacterController>();
		playerMeshPos = new Vector3 (0f,0.066f,0f);
	}

	void OnTriggerEnter(Collider other) {
		if (other != target) //The colliding object isn't our object
		{
			//Debug.Log("something's wrong");
			return; //don't do anything if it's not our target
		}
		else {
			player.GetComponent<ThirdPersonController>().movable = false;
			player.GetComponent<ThirdPersonController>().hanging = true;
			player.GetComponent<ThirdPersonController>().moveSpeed = 0.0f;
			player.GetComponent<ThirdPersonController>().verticalSpeed = 0.0f;
			player.GetComponent<ThirdPersonController>().inAirVelocity = Vector3.zero;
			Debug.Log("should be hanging");
			startRot = player.transform.rotation;
			endRot = this.transform.rotation;
			player.transform.rotation = Quaternion.Lerp(startRot,endRot,lerpTime);
			startPos = player.transform.position;
			endPos = player.transform.position;
			//endPos.x = this.transform.position.x + clingDistance;
			endPos.y = this.transform.position.y - charHeight;
			//endPos.z = player.transform.forward.z;
			player.transform.position = Vector3.Lerp(startPos,endPos,lerpTime);
			shiftPlayer = Vector3.forward * clingDistance;
			playerMesh.transform.Translate(shiftPlayer);
		}
	}
	void OnTriggerExit(Collider other) {
		playerMesh.transform.Translate (-shiftPlayer);
		player.GetComponent<ThirdPersonController> ().hanging = false;
		player.GetComponent<ThirdPersonController> ().climb = false;
		player.GetComponent<ThirdPersonController>().movable = true;
	}

	// Update is called once per frame
	void Update () {
	
	}
}
