using UnityEngine;
using System.Collections;

public class ClimbingVolume : MonoBehaviour 
{
    void OnTriggerEnter()
    {
        TP_Animator.instance.SetClimbPoint(transform);
    }
    void OnTriggerExit()
    {
        TP_Animator.instance.ClearClimbPoint(transform);
    }
}
