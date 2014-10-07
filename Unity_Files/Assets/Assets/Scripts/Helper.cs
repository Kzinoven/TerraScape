using UnityEngine;
using System.Collections;

public static class Helper 
{
    public static float ClampAngle(float angle, float minAngle, float maxAngle)
    {
        do
        {
            if (angle < -360)
                angle += 360;
            if (angle > 360)
                angle -= 360;

        } while (angle < -360 || angle > 360);
        
        return Mathf.Clamp(angle, minAngle, maxAngle);
    }
}
