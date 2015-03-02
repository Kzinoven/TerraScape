using UnityEngine;
using System.Collections;

public class destructionControl : MonoBehaviour {
	public GameObject remains;
	public void Break (){
		Instantiate (remains, transform.position, transform.rotation);
		Destroy (gameObject, 0);
	}
}
