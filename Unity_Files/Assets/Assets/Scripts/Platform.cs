using UnityEngine;
using System.Collections;

public class Platform : MonoBehaviour
{
    #region fields
    bool isActive; //tells us whether the platform has been activated
    bool isMoving; //tells us whether the platform is moving
    bool isPermanent = false;
    public float movementTime; //time in seconds the platform should take to move back and forth
    public float activeTime; //amount of time in seconds the platform should remain active; if set to zero, the platform will never deactivate
    float currentTime; //current time in seconds
    float targetTime; //time that the platform has to deactivate
    Vector3 initPosition; //the initial position of the platform
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
    }
    void Update()
    {
        if (isMoving)
        {
            //if the platform is moving, figure out where it is going to
            Vector3 currentPosition = gameObject.transform.position;
            Vector3 targetPosition;
            if (isActive)
                targetPosition = activePosition;
            else
                targetPosition = initPosition;

            //Linearly interpolate the position of the platform
            Vector3.Lerp(currentPosition, targetPosition, movementTime);

            //Stop the platform if it is within a certain threshold
            if(Mathf.Abs(targetPosition.x - currentPosition.x) < 0.01f
                && Mathf.Abs(targetPosition.y - currentPosition.y) < 0.01f
                && Mathf.Abs(targetPosition.z - currentPosition.z) < 0.01f)
            {
                //Stop moving, set the correct Time objects
                isMoving = false;
                currentTime = Time.time;
                targetTime = Time.time + activeTime;
                if (currentTime == targetTime)
                    isPermanent = true;
            }
        }
        else if (isActive && !isPermanent)
        {
            //count up to the target time in seconds so long as the platform can deactivate
            if (currentTime < targetTime)
            {
                currentTime = Time.time;
            }
            else
                Deactivate();
        }
    }
    void Deactivate()
    {
        isActive = false;
        isMoving = true;
    }
    #endregion
}