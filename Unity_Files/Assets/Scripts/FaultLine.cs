using UnityEngine;
using System.Collections;

public class FaultLine : MonoBehaviour
{
    public GameObject triggerObject;

	public void OnTriggerEnter(){Activate ();}

	public void Activate()
    {
        if (triggerObject.GetComponent<Platform>() != null)
        {
            triggerObject.GetComponent<Platform>().Activate();
        }
        else if (triggerObject.GetComponent<FallingRock>() != null)
        {
            triggerObject.GetComponent<FallingRock>().Fall();
        }
		else if (triggerObject.GetComponent<faultRotateObject>() != null)
		{
			triggerObject.GetComponent<faultRotateObject>().Activate();
		}
        else if (triggerObject.GetComponent<Breakable>() != null)
        {
            triggerObject.GetComponent<Breakable>().BreakApart();
        }
        else
            return;
    }
}