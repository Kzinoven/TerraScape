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

	private float elevationAngle = 0;
	private float turnAngle = 0;//negative is right, positive is left (from behind)

	private ThirdPersonController walker;	//reference to walker script

	// Use this for initialization
	void Awake () {
		instance = this;
		walker = GetComponent<ThirdPersonController> ();
	}
	
	// Update is called once per frame
	void Update () {
		//turn towards the forward direction
		//transform.Rotate(0, Input.GetAxis ("Horizontal") * rotateSpeed, 0);
		//Vector3 forward = transform.TransformDirection(Vector3.forward);
		//float curSpeed = speed * Input.GetAxis ("Vertical");
		//controller.SimpleMove(forward * curSpeed);			

		//angle of elevation
		elevationAngle = transform.eulerAngles.x;
		elevationAngle *= Mathf.Deg2Rad; // trig functions use radians

		RaycastHit hit1, hit2 ;

		//check that there is terrain directly below and in front
		if (Physics.Raycast(tracker.position, -Vector3.up, out hit1)) {
			if (Physics.Raycast(tracker.TransformPoint(Vector3.forward * 0.1f), -Vector3.up, out hit2)) {
				transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.LookRotation(hit2.point - hit1.point, hit1.normal), Time.deltaTime * 20);
			}
			if (controller.isGrounded) 
			{
				// We are grounded, so recalculate
				// move direction directly from axes
				/*moveDirection = new Vector3(Input.GetAxis("Horizontal"), 0,
				                        Input.GetAxis("Vertical"));
				moveDirection = transform.TransformDirection(moveDirection);
				moveDirection *= speed;*/

				float turnAngleDeg = 20 * Input.GetAxis("Horizontal"); //max 20 degrees turning side to side
				turnAngle = turnAngleDeg * Mathf.Deg2Rad;

				//transform.RotateAround(Vector3.zero, Vector3.up, turnAngleDeg);//rotate around z axis

				//trail renderer not ready yet
				// GetComponent("TrailRenderer").enabled = true;

				if (Input.GetButton ("Jump")) {
					moveDirection.y = jumpSpeed;
				}
			} else if (!controller.isGrounded)
			{

				//disable trailrenderer
				//GetComponent("TrailRenderer").enabled = false;
			}
			
			// Move the controller
			//controller.Move(moveDirection * Time.deltaTime);	
		}

		//stop sliding
		if (Input.GetKeyDown(KeyCode.N))
		{
			Debug.Log("Stopped sliding.");
			walker.stopSliding();
			this.enabled = false;
		}

	}

	void FixedUpdate () {
		rigidbody.AddForce (-Vector3.up * gravity);
		if (controller.isGrounded)
		{
			rigidbody.AddRelativeForce(Vector3.forward * 65 * gravity * Mathf.Sin(elevationAngle)); //forward force = m * g * sin(angle)
			rigidbody.AddRelativeForce(Vector3.right * 65 * gravity * Mathf.Sin(elevationAngle) * Mathf.Cos(turnAngle));//turning force = m * g * sin(elevation angle) * cos (turn angle)
		}
	}
}
