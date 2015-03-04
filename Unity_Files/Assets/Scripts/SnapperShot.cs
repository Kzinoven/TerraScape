using UnityEngine;
using System.Collections;

public class SnapperShot : MonoBehaviour
{
    #region fields
	public float moveSpeed = 10f;
	public float maxDistance = 50f;
	private float currentDistance = 0f;
    #endregion

    #region properties

    #endregion

    #region functions
    void Start()
    {

    }

    void Update()
    {
		//move forward
		transform.Translate (Vector3.forward * Time.deltaTime * moveSpeed);
		if ((currentDistance += moveSpeed * Time.deltaTime) >= maxDistance)
		{
			Destroy(gameObject);
		}
    }

    void OnTriggerEnter(Collider other)
    {
		other.gameObject.SendMessage ("snapperShotHit", SendMessageOptions.DontRequireReceiver);
		//maybe create a particle effect?
		Destroy (gameObject);
    }
    #endregion
}