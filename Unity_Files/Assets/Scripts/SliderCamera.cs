using UnityEngine;
using System.Collections;

public class SliderCamera : MonoBehaviour {
	public Transform target;
	float distance = 10.0f;
	
	float xSpeed = 250.0f;
	float ySpeed = 120.0f;
	
	float yMinLimit = -20f;
	float yMaxLimit = 80f;
	
	private float x = 0.0f;
	private float y = 0.0f;

	void Start () {
		Vector3 angles = transform.eulerAngles;
		x = angles.y;
		y = angles.x;
		
		// Make the rigid body not change rotation
		if (rigidbody)
			rigidbody.freezeRotation = true;
	}
	
	void LateUpdate () {
		if (target) {
			x += Input.GetAxis("Mouse X") * xSpeed * 0.02f;
			y -= Input.GetAxis("Mouse Y") * ySpeed * 0.02f;

			y = Helper.ClampAngle(y, yMinLimit, yMaxLimit);
			
			Quaternion rotation = Quaternion.Euler(y, x, 0);
			Vector3 position = rotation * new Vector3(0.0f, 0.0f, -distance) + target.position;
			
			transform.rotation = rotation;
			transform.position = position;
		}
	}
}