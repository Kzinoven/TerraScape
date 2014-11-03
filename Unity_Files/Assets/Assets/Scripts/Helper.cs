using UnityEngine;
using System.Collections;

public static class Helper 
{
    public struct ClipPlanePoints
    {
        public Vector3 UpperLeft;
        public Vector3 UpperRight;
        public Vector3 LowerLeft;
        public Vector3 LowerRight;
    }

    public static float ClampAngle(float angle, float minAngle, float maxAngle)
    {
        //specialised clamping function which prevents angles from exceeding 360deg in either direction
        do
        {
            if (angle < -360)
                angle += 360;
            if (angle > 360)
                angle -= 360;

        } while (angle < -360 || angle > 360);
        
        return Mathf.Clamp(angle, minAngle, maxAngle);
    }

    public static ClipPlanePoints CalculateNearClipPlane(Vector3 pos)
    {
        //Returns four values to match the position of the near clipping plane of the assigned camera
        var clipPlanePoints = new ClipPlanePoints();

        if (Camera.main == null)
        {
            return clipPlanePoints;
        }

        var cameraLoc = Camera.main.transform;
        var halfFOV = (Camera.main.fieldOfView / 2) * Mathf.Deg2Rad;
        var aspectRatio = Camera.main.aspect;
        var clipPlaneDistance = Camera.main.nearClipPlane;
        var height = clipPlaneDistance * Mathf.Tan(halfFOV);
        var width = height * aspectRatio;

        clipPlanePoints.LowerRight = pos + cameraLoc.right * width;
        clipPlanePoints.LowerRight -= cameraLoc.up * height;
        clipPlanePoints.LowerRight += cameraLoc.forward * clipPlaneDistance;

        clipPlanePoints.LowerLeft = pos - cameraLoc.right * width;
        clipPlanePoints.LowerLeft -= cameraLoc.up * height;
        clipPlanePoints.LowerLeft += cameraLoc.forward * clipPlaneDistance;

        clipPlanePoints.UpperRight = pos + cameraLoc.right * width;
        clipPlanePoints.UpperRight += cameraLoc.up * height;
        clipPlanePoints.UpperRight += cameraLoc.forward * clipPlaneDistance;

        clipPlanePoints.UpperLeft = pos - cameraLoc.right * width;
        clipPlanePoints.UpperLeft += cameraLoc.up * height;
        clipPlanePoints.UpperLeft += cameraLoc.forward * clipPlaneDistance;

        return clipPlanePoints;
    }
}
