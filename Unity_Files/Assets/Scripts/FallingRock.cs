using UnityEngine;
using System.Collections;

[RequireComponent (typeof (Rigidbody))]
public class FallingRock : MonoBehaviour
{
    #region fields
    private Rigidbody rigidbody;
    #endregion

    #region properties

    #endregion

    #region functions
    void Awake()
    {
        rigidbody = gameObject.GetComponent<Rigidbody>();
        rigidbody.isKinematic = true;
    }

    public void Fall()
    {
        rigidbody.isKinematic = false;
        //activate the falling rock's physics by enabling a rigidbody
    }
    #endregion
}