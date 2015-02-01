using UnityEngine;
using System.Collections;

public class RockBreaker : MonoBehaviour {

	public GameObject Rocks;//pointer to the falling rocks object
	bool broken = false;

	//on collison with this trigger, call this method from the colliding object
	void Break(){
		if (!broken) {
			Rocks.SendMessage ("Break");
			broken = true;
		}
	}
}
