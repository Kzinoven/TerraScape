using UnityEngine;
using System.Collections;

//controlling logic for enemies, each type implements this class
public class EnemyController : MonoBehaviour
{
	//last known location of player
	private Vector3 playerLocation;

	//Unity's scale is 1 meter per unit by default, but can be changed.
	private float attackRange = 1;

	// Use this for initialization
	void Start ()
	{

	}

	// Update is called once per frame
	void Update ()
	{
		updatePlayerLocation ();
	}

	/// <summary>
	/// Updates the player location.
	/// May be updated later to constrain finding player by line-of-sight, range, etc.
	/// </summary>
	void updatePlayerLocation()
	{
		playerLocation = GetComponent("Player").transform.position;
	}
}

