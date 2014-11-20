using UnityEngine;
using System.Collections;

public class Bomb : MonoBehaviour
{
    public float additionalDownwardForce = 1000.0f;
    public GameObject explosion;

    public void Awake()
    {
        this.rigidbody.AddForce(Vector3.down * additionalDownwardForce);
    }

    public void OnTriggerEnter(Collider other)
    {
        if (explosion)
        {
            Instantiate(explosion, this.transform.position, this.transform.rotation);
        }

        if (other.GetComponent<TerrainDeformer>() != null)
        {
           other.GetComponent<TerrainDeformer>().DestroyTerrain(this.transform.position,10);
        }
        Destroy(this.gameObject);
    }
}