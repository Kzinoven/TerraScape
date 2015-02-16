﻿#pragma strict

var remains: GameObject;
var insideZone: boolean = false;

function OnTriggerEnter (other:Collider)
{
	if (other.tag == 'Player'){
		//Debug.Log ('inside the collider');
		insideZone = true;
		}
}

function OnTriggerExit (other:Collider)
{
	if (other.tag == 'Player'){
		//Debug.Log ('outside the collider');
		insideZone = false;
		}
}

function Update ()
{
	if (insideZone && Input.GetKey(KeyCode.E)){		
				Break();
			}
}

function Break(){
	Instantiate(remains, transform.position, transform.rotation);
	Destroy(gameObject);
}		