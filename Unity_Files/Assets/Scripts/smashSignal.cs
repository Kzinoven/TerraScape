using UnityEngine;
using System.Collections;

public class smashSignal : MonoBehaviour {
	private Vector3 center;
	public float x;
	public float y;
	public float z;
	public float radius;
	public GameObject target;
	// Use this for initialization
	void Start () {
		center.x = x;
		center.y = y;
		center.z = z;
	}
	void OnTriggerEnter(Collider other){
		if (other.tag == "Breakable")
			target = other.gameObject;
			target.GetComponent<destructionControl>().Break ();
	}
	// Update is called once per frame
	/*void Update () {
		signal (center, radius);
	}
	void signal(Vector3 center, float radius) {
		Collider[] hitColliders = Physics.OverlapSphere(center, radius);
		int i = 0;
		while (i < hitColliders.Length) {
			if (hitColliders[i].tag == "Breakable")
				hitColliders[i].gameObject.GetComponent<destructionController>().Break();
			i++;
		}
	}*/
}
