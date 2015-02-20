using UnityEngine;
using System.Collections;

public class rockBridgeTrigger : MonoBehaviour
{
	public GameObject triggerObject;
	
	public void OnTriggerExit(){Activate ();}
	
	public void Activate()
	{
		if (triggerObject.GetComponent<Platform>() != null)
		{
			triggerObject.GetComponent<Platform>().Activate();
		}
		else if (triggerObject.GetComponent<faultRotateObject>() != null)
		{
			triggerObject.GetComponent<faultRotateObject>().Activate();
		}
		else
			return;
	}
}
