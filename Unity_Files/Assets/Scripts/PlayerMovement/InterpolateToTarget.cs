using UnityEngine; using System.Collections;

public class InterpolateToTarget : MonoBehaviour {

public Transform target;
public float xInterpolation = 5;
public float yInterpolation = 5;
public float zInterpolation = 5;
public float rotationInterpolation = 5;

void Update () {
	Vector3 localPos = target.InverseTransformPoint(transform.position);
	localPos.x -= (localPos.x * xInterpolation * Time.deltaTime);
	localPos.y -= (localPos.y * yInterpolation * Time.deltaTime);
	localPos.z -= (localPos.z * zInterpolation * Time.deltaTime);
	transform.rotation = Quaternion.Slerp(transform.rotation, target.rotation, rotationInterpolation * Time.deltaTime);
	transform.position = target.TransformPoint(localPos);
}
}