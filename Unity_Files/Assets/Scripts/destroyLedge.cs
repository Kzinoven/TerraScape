using UnityEngine;
using System.Collections;

public class destroyLedge : MonoBehaviour {


	void Update () {
		if (Input.GetKeyDown("u")){
			Destroy (gameObject, 0);
		}
	}
}
