using UnityEngine;
using System.Collections;

public class PlaytesterMenu : MonoBehaviour {
	bool enabled = false;
	public GUITexture textureOverlay;
	public int overlayDepth = 1;

	GameObject player;
	TP_Motor playerMotor;

	// Use this for initialization
	void Start () {
		player = GameObject.FindWithTag ("Player");
		if (player == null) {
			throw new UnityException("No player object in this scene.");
		}
		playerMotor = player.GetComponent<TP_Motor>();
		if (playerMotor == null) {
			throw new UnityException("Player has no TP_Motor component.");
		}

		//make the overlay the same size as the screen
		textureOverlay.transform.position = new Vector3(0, 0, overlayDepth);
		textureOverlay.pixelInset = new Rect(0, 0, Screen.width, Screen.height);
		textureOverlay.enabled = false;
	}
	
	// Update is called once per frame
	void Update () {
		//toggle GUI with Escape
		if(Input.GetKeyDown(KeyCode.Escape))
		{
			if(enabled)
			{
				enabled = false;
				textureOverlay.enabled = false;
				Time.timeScale = 1;
			}
			else
			{
				enabled=true;
				textureOverlay.enabled = true;
				Time.timeScale = 0;
			}
		}
	}

	string walkSpeed = "8";
	string jumpSpeed = "6";

	//create GUI elements in here
	void OnGUI (){
		if (!enabled) 
		{return;}

		walkSpeed = labelTxtField (new Rect (20, 20, 100, 20), walkSpeed, "Walk Speed");

		jumpSpeed = labelTxtField (new Rect (20, 50, 100, 20), jumpSpeed, "Jump Speed");
		
		//if the GUI has been changed, validate each value and update parameters accordingly 
		if (GUI.changed) {
			float newWalkSpeed;
			float newJumpSpeed;
			if (float.TryParse(walkSpeed, out newWalkSpeed)){
				playerMotor.forwardSpeed = newWalkSpeed;
				playerMotor.backwardSpeed = newWalkSpeed;
				playerMotor.strafingSpeed = newWalkSpeed;
			}

			if (float.TryParse(jumpSpeed, out newJumpSpeed)){
				playerMotor.jumpSpeed = newJumpSpeed;
			}

		}
	}

	//create a label with a text field next to it
	string labelTxtField(Rect screenRect, string value, string labelText){
		GUI.Label (screenRect, labelText);

		//move the text field to the end of the label
		screenRect.x += screenRect.width;

		value = GUI.TextField (screenRect, value);
		return value;
	}
}
