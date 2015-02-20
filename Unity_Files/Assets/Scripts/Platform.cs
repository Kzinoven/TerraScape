using UnityEngine;
using System.Collections;

public class Platform : MonoBehaviour
{
    #region fields
    bool isActive; //tells us whether the platform has been activated
    bool isMoving; //tells us whether the platform is moving
    bool isPermanent = false;
    float startTime;
    public float movementTime; //time in seconds the platform should take to move back and forth
    public float activeTime; //amount of time in seconds the platform should remain active; if set to zero, the platform will never deactivate
    float currentTime; //current time in seconds
    float targetTime; //time that the platform has to deactivate
    Vector3 initPosition; //the initial position of the platform
    Vector3 startPosition; //stores when the platform STARTS moving
    public Vector3 activePosition; //the position the platform will be moved to
    #endregion

    #region functions
    void Awake()
    {
        isActive = false;
        isMoving = false;
        initPosition = gameObject.transform.position;
    }
    public void Activate()
    {
        isActive = true;
        isMoving = true;
        startTime = Time.time;
        targetTime = startTime + movementTime;
        startPosition = gameObject.transform.position;
    }
    void Update()
    {
        currentTime = Time.time;

        if (isMoving)
        {
            //if the platform is moving, figure out where it is going to
            Vector3 targetPosition;
			Vector3 targetRotation;
            if (isActive)
                targetPosition = activePosition;
            else
                targetPosition = initPosition;

            float timeRatio = (currentTime - startTime) / movementTime;

            //Linearly interpolate the position of the platform
            gameObject.transform.position = Vector3.Lerp(startPosition, targetPosition, timeRatio);
            //Stop the platform if it is within a certain threshold
            if(timeRatio >= 1f)
            {
                //Stop moving, set the correct Time objects
                isMoving = false;
                if (activeTime == 0f)
                    isPermanent = true;
                else
                    targetTime = currentTime + activeTime;
            }
        }
        
        else if (isActive && !isPermanent)
        {
            //count up to the target time in seconds so long as the platform can deactivate
            if (currentTime >= targetTime)
                Deactivate();
        }
    }
    void Deactivate()
    {
        isActive = false;
        isMoving = true;
        startTime = Time.time;
        targetTime = startTime + movementTime;
        startPosition = gameObject.transform.position;
    }

    void OnTriggerEnter(Collider other)
    {
        other.gameObject.transform.parent = gameObject.transform;
    }

    void OnTriggerExit(Collider other)
    {
        other.gameObject.transform.parent = null;
    }
    #endregion
}