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
    public float smoothX = 0.05f;
    public float smoothY = 0.1f;

    public float mouseSensitivityX = 5f;
    public float mouseSensitivityY = 5f;
    public float mouseWheelSensitivity = 5f;

    public float minLimitY = -40f;
    public float maxLimitY = 80f;

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

    void Awake()
    {
        instance = this;
    }

    void Start()
    {
        distance = Mathf.Clamp(distance, minDistance, maxDistance);
        startDistance = distance;
        Reset();
    }

    void LateUpdate()
    {
        if (TargetLookAt == null)
        {
            return;
        }
        HandlePlayerInput();
        CalculateDesiredPosition();
        UpdatePosition();
    }

    void HandlePlayerInput()
    {
        var deadZone = 0.01f;

        if (Input.GetMouseButton(1))
        {
            mouseX += Input.GetAxis("Mouse X") * mouseSensitivityX;
            mouseY -= Input.GetAxis("Mouse Y") * mouseSensitivityY;
        }

        mouseY = Helper.ClampAngle(mouseY, minLimitY, maxLimitY);

        if (Input.GetAxis("Mouse ScrollWheel") < -deadZone || Input.GetAxis("Mouse ScrollWheel") > deadZone)
        {
            desiredDistance = Mathf.Clamp(distance - Input.GetAxis("Mouse ScrollWheel") * mouseWheelSensitivity, minDistance, maxDistance);
        }
    }

    void CalculateDesiredPosition()
    {
        distance = Mathf.SmoothDamp(distance, desiredDistance, ref velocityDistance, distanceSmooth);

        desiredPosition = CalculatePosition(mouseY, mouseX, distance);
    }

    Vector3 CalculatePosition(float rotationX, float rotationY, float distance)
    {
        //camera direction/rotation
        Vector3 direction = new Vector3(0, 0, -distance);
        Quaternion rotation = Quaternion.Euler(rotationX, rotationY, 0);

        return TargetLookAt.position + rotation * direction;
    }

    void UpdatePosition()
    {
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

        targetLookAt = GameObject.Find("targetLookAt") as GameObject;

        if (targetLookAt == null)
        {
            targetLookAt = new GameObject("targetLookAt");
            targetLookAt.transform.position = Vector3.zero;
        }

        camera.TargetLookAt = targetLookAt.transform;
    }
}
