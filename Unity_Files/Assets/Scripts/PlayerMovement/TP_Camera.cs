using UnityEngine;
using System.Collections;

public class TP_Camera : MonoBehaviour 
{
    public static TP_Camera instance;
    public Transform TargetLookAt;
    public float distance = 5f;
    public float minDistance = 3f;
    public float maxDistance = 10f;
    public float distanceSmooth = 0.05f;
    public float distanceResumeSmooth = 1f;
    public float smoothX = 0.05f;
    public float smoothY = 0.1f;

    public float mouseSensitivityX = 5f;
    public float mouseSensitivityY = 5f;
    public float mouseWheelSensitivity = 5f;

    public float minLimitY = -40f;
    public float maxLimitY = 80f;

    public float occlusionDistanceStep = 0.5f;
    public int maxOcclusionChecks = 10;

	public bool movable = true;

    private float mouseX = 0f;
    private float mouseY = 0f;
    private float velocityX = 0f;
    private float velocityY = 0f;
    private float velocityZ = 0f;
    private Vector3 position = Vector3.zero;
    private float startDistance = 0f;
    private float desiredDistance = 0f;
    private Vector3 desiredPosition = Vector3.zero;
    private float velocityDistance = 0f;
    private float distanceSmoothToggle = 0f;
    private float preOccludedDistance = 0f;

	private PlaytesterMenu menu;

    void Awake()
    {
		TargetLookAt = GameObject.Find("cameraTarget").transform;
        instance = this;
		menu = GetComponent<PlaytesterMenu> ();
    }

    void Start()
    {
        distance = Mathf.Clamp(distance, minDistance, maxDistance);
        startDistance = distance;
        Reset();
    }

    void LateUpdate()
    {
		if (movable && !menu.menuOpen){
        //move camera AFTER all other calculations have been made
		//don't move camera while testing menu is open
        if (TargetLookAt == null)
        {
            //do nothing if there is no characterController to observe
            return;
        }

        //Get camera motion info
        HandlePlayerInput();

        //loop, attempt to move camera
        int count = 0;
        /*do
        {
            //While the camera is occluded, move the camera
            CalculateDesiredPosition();
            count++;
        } while(CheckIfOccluded(count));*/
		CalculateDesiredPosition();
        //force update position
        UpdatePosition();
		}
		else{
			return;
		}
    }

    void HandlePlayerInput()
    {
        //Gets mouse input and translates into camera motion
        float deadZone = 0.01f;

        //on right click and drag, move camera
        //if (Input.GetMouseButton(0))
        //{
            mouseX += Input.GetAxis("Mouse X") * mouseSensitivityX;
            mouseY -= Input.GetAxis("Mouse Y") * mouseSensitivityY;
        //}

        mouseY = Helper.ClampAngle(mouseY, minLimitY, maxLimitY);

        //on mouse wheel, zoom in/out
        if (Input.GetAxis("Mouse ScrollWheel") < -deadZone || Input.GetAxis("Mouse ScrollWheel") > deadZone)
        {
            desiredDistance = Mathf.Clamp(distance - Input.GetAxis("Mouse ScrollWheel") * mouseWheelSensitivity, minDistance, maxDistance);
            preOccludedDistance = desiredDistance;
            distanceSmoothToggle = distanceSmooth;
        }
    }

    void CalculateDesiredPosition()
    {
        ResetDesiredDistance();
        distance = Mathf.SmoothDamp(distance, desiredDistance, ref velocityDistance, distanceSmoothToggle);

        desiredPosition = CalculatePosition(mouseY, mouseX, distance);
    }

    Vector3 CalculatePosition(float rotationX, float rotationY, float distance)
    {
        //camera direction/rotation
        Vector3 direction = new Vector3(0, 0, -distance);
        Quaternion rotation = Quaternion.Euler(rotationX, rotationY, 0);

        return TargetLookAt.position + rotation * direction;
    }

    float CheckCameraPoints(Vector3 from, Vector3 to)
    {
        //Checks rays FROM the target TO the Camera to detect occlusion
        float nearestDistance = -1f;

        RaycastHit hitInfo;
        Helper.ClipPlanePoints clipPlanePoints = Helper.CalculateNearClipPlane(to);

        /* Create view pyramid
        Debug.DrawLine(from, to + transform.forward * -camera.nearClipPlane, Color.red);
        Debug.DrawLine(from, clipPlanePoints.LowerLeft, Color.cyan);
        Debug.DrawLine(from, clipPlanePoints.LowerRight, Color.cyan);
        Debug.DrawLine(from, clipPlanePoints.UpperLeft, Color.cyan);
        Debug.DrawLine(from, clipPlanePoints.UpperRight, Color.cyan);
        Debug.DrawLine(clipPlanePoints.UpperLeft, clipPlanePoints.UpperRight, Color.yellow);
        Debug.DrawLine(clipPlanePoints.UpperRight, clipPlanePoints.LowerRight, Color.yellow);
        Debug.DrawLine(clipPlanePoints.LowerRight, clipPlanePoints.LowerLeft, Color.yellow);
        Debug.DrawLine(clipPlanePoints.LowerLeft, clipPlanePoints.UpperLeft, Color.yellow);
        */

        //Detect linecasts from player position and find collisions with near clip plane points
        if (Physics.Linecast(from, clipPlanePoints.UpperLeft, out hitInfo) && IgnoreOcclusion(hitInfo.collider))
            nearestDistance = hitInfo.distance;

        if (Physics.Linecast(from, clipPlanePoints.LowerLeft, out hitInfo) && IgnoreOcclusion(hitInfo.collider))
            if (hitInfo.distance < nearestDistance || nearestDistance == -1)
                nearestDistance = hitInfo.distance;

        if (Physics.Linecast(from, clipPlanePoints.UpperRight, out hitInfo) && IgnoreOcclusion(hitInfo.collider))
            if (hitInfo.distance < nearestDistance || nearestDistance == -1)
                nearestDistance = hitInfo.distance;

        if (Physics.Linecast(from, clipPlanePoints.LowerRight, out hitInfo) && IgnoreOcclusion(hitInfo.collider))
            if (hitInfo.distance < nearestDistance || nearestDistance == -1)
                nearestDistance = hitInfo.distance;

        if (Physics.Linecast(from, to + transform.forward * -camera.nearClipPlane, out hitInfo) && IgnoreOcclusion(hitInfo.collider))
            if (hitInfo.distance < nearestDistance || nearestDistance == -1)
                nearestDistance = hitInfo.distance;

        return nearestDistance;
    }

    bool IgnoreOcclusion(Collider collider)
    {
        bool ignore = false;
        if (collider.tag == "Player" || collider.tag == "Item")
            ignore = true;

        return ignore;
    }

    bool CheckIfOccluded(int count)
    {
        //Determines if we are occluded, returns false if not

        //Assume there is no occlusion
        bool isOccluded = false;
        float nearestDistance = CheckCameraPoints(TargetLookAt.position, desiredPosition);

        if (nearestDistance != -1f)
        {
            //the camera is occluded
            if (count < maxOcclusionChecks)
            {
                //attempt to step forward in increments
                isOccluded = true;
                distance -= occlusionDistanceStep;
                if (distance < 3.0f)
                    distance = 3.0f;
            }
            else
            {
                //brute force camera position
                distance = nearestDistance - Camera.main.nearClipPlane;
            }

            desiredDistance = distance;
            distanceSmoothToggle = distanceResumeSmooth;
        }

        return isOccluded;
    }

    void ResetDesiredDistance()
    {
        if (desiredDistance < preOccludedDistance)
        {
            var pos = CalculatePosition(mouseY, mouseX, preOccludedDistance);

            var nearestDistance = CheckCameraPoints(TargetLookAt.position, pos);
            if (nearestDistance == -1 || nearestDistance > preOccludedDistance)
            {
                desiredDistance = preOccludedDistance;
            }
        }
    }

    void UpdatePosition()
    {
        //Smoothly change position to match desiredPosition
        var positionX = Mathf.SmoothDamp(position.x, desiredPosition.x, ref velocityX, smoothX);
        var positionY = Mathf.SmoothDamp(position.y, desiredPosition.y, ref velocityY, smoothY);
        var positionZ = Mathf.SmoothDamp(position.z, desiredPosition.z, ref velocityZ, smoothX);

        position = new Vector3(positionX, positionY, positionZ);
        transform.position = position;
        transform.LookAt(TargetLookAt);

    }

    public void Reset()
    {
        mouseX = 0;
        mouseY = 10;
        distance = startDistance;
        desiredDistance = distance;
        preOccludedDistance = distance;
    }

    public static void EstablishMainCamera()
    {
        //Uses Camera.main if it exists, otherwise create new and assign it to main
        GameObject tempCamera;
        GameObject targetLookAt;
        TP_Camera camera;

        if (Camera.main != null)
        {
            tempCamera = Camera.main.gameObject;
        }
        else
        {
            tempCamera = new GameObject("Main Camera");
            tempCamera.AddComponent("Camera");
            tempCamera.tag = "MainCamera";
        }

        tempCamera.AddComponent("TP_Camera");
        camera = tempCamera.GetComponent("TP_Camera") as TP_Camera;

        //Use targetLookAt if it exists, otherwise create new and assign
        targetLookAt = GameObject.Find("targetLookAt") as GameObject;

        if (targetLookAt == null)
        {
            targetLookAt = new GameObject("targetLookAt");
            targetLookAt.transform.position = Vector3.zero;
        }

        camera.TargetLookAt = targetLookAt.transform;
    }
}
