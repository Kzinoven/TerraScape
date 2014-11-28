using UnityEngine;
using System.Collections;

public class Enemy_Animator : MonoBehaviour 
{
    void Awake()
    {
        transform.FindChild("shieldCreature_inProgress_v5_unsmoothed_walk").animation.CrossFade("Walk");
    }
}
