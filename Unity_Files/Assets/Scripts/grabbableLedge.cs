using UnityEngine;
using System.Collections;

public class grabbableLedge : MonoBehaviour {
	public Transform player;
	public Collider target;
	private float lerpTime = 200.0f;
	public float charHeight = 0.5f;
	public float clingDistance = 0.0f;
	private Vector3 startPos;
	private Vector3 endPos;
	private Quaternion startRot;
	private Quaternion endRot;
	// Use this for initialization
	void Start () {

	}

	void OnTriggerEnter(Collider other) {
		if (other != target) //The colliding object isn't our object
		{
			Debug.Log("something's wrong");
			return; //don't do anything if it's not our target
		}
		else {
			player.GetComponent<ThirdPersonController>().hanging = true;
			player.GetComponent<ThirdPersonController>().moveSpeed = 0.0f;
			player.GetComponent<ThirdPersonController>().verticalSpeed = 0.0f;
			player.GetComponent<ThirdPersonController>().inAirVelocity = Vector3.zero;
			Debug.Log("should be hanging");
			startPos = player.transform.position;
			endPos.x = this.transform.position.x + clingDistance;
			endPos.z = player.transform.position.z;
			endPos.y = this.transform.position.y - charHeight;
			startRot = player.transform.rotation;
			endRot = this.transform.rotation;
			player.transform.position = Vector3.Lerp(startPos,endPos,lerpTime);
			player.transform.rotation = Quaternion.Lerp(startRot,endRot,lerpTime);
		}
	}
	void OnTriggerExit(Collider other) {
			player.GetComponent<ThirdPersonController> ().hanging = false;
			player.GetComponent<ThirdPersonController> ().climb = false;
	}

	// Update is called once per frame
	void Update () {
	
	}
}
