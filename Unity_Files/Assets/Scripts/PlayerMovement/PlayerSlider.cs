using UnityEngine;
using System.Collections;

public class PlayerSlider : MonoBehaviour {

	public float speed = 10.0f;
	public float jumpSpeed  = 8.0f;
	public float gravity = 10.0f;
	private Vector3 moveDirection = Vector3.zero;
	public Transform tracker;
	public float rotateSpeed = 3.0f;
	public CharacterController controller;

	public static PlayerSlider instance;

	// Use this for initialization
	void Awake () {
		instance = this;
	}
	
	// Update is called once per frame
	void Update () {
		//turn towards the forward direction
		transform.Rotate(0, Input.GetAxis ("Horizontal") * rotateSpeed, 0);
		Vector3 forward = transform.TransformDirection(Vector3.forward);
		float curSpeed = speed * Input.GetAxis ("Vertical");
		controller.SimpleMove(forward * curSpeed);			
		
		RaycastHit hit1, hit2 ;

		//check that there is terrain directly below and in front
		if (Physics.Raycast(tracker.position, -Vector3.up, out hit1)) {
			if (Physics.Raycast(tracker.TransformPoint(Vector3.forward * 0.1f), -Vector3.up, out hit2)) {
				transform.rotation = Quaternion.LookRotation(hit2.point - hit1.point, hit1.normal);
			}
			if (!controller.isGrounded)
			{
				//disable trailrenderer
				//GetComponent("TrailRenderer").enabled = false;
			}
			else if (controller.isGrounded) {
				// We are grounded, so recalculate
				// move direction directly from axes
				moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0,
				                        Input.GetAxis("Vertical"));
				moveDirection = transform.TransformDirection(moveDirection);
				moveDirection *= speed;

				//trail renderer not ready yet
				// GetComponent("TrailRenderer").enabled = true;
				if (Input.GetButton ("Jump")) {
					moveDirection.y = jumpSpeed;
				}
			}
			
			// Move the controller
			controller.Move(moveDirection * Time.deltaTime);	
		}		

	}

	void FixedUpdate () {
		rigidbody.AddForce (-Vector3.up * 10);	
	}
}
