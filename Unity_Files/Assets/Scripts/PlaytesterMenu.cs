using UnityEngine;
using System.Collections;

public class PlaytesterMenu : MonoBehaviour {
	bool enabled = false;
	public GUITexture textureOverlay;
	public int overlayDepth = 1;

	GameObject player;
	TP_Motor playerMotor;

	BasicEnemyAI enemyTest;

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

		enemyTest = GameObject.Find ("shieldCreature_inProgress_v5_unsmoothed_walk").GetComponent<BasicEnemyAI> ();

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

	#region Editor Variables
	string walkSpeed = "8";
	string jumpSpeed = "6";
	string enemyAtkSpeed = "1";
	string enemyAtkDamage = "5";
	string enemyAtkRange = "4";
	string enemyChaseSpeed = "5";
	string enemySightRange = "20";
	float labelWidth = 150;

	float newWalkSpeed;
	float newJumpSpeed;
	float newAtkSpeed;
	float newAtkDamage;
	float newAtkRange;
	float newChaseSpeed;
	float newSightRange;
	#endregion
	//create GUI elements in here
	void OnGUI (){
		if (!enabled) 
		{return;}

		walkSpeed = labelTxtField (new Rect (20, 20, labelWidth, 20), walkSpeed, "Walk Speed");

		jumpSpeed = labelTxtField (new Rect (20, 50, labelWidth, 20), jumpSpeed, "Jump Speed");

		enemyAtkSpeed = labelTxtField (new Rect (20, 80, labelWidth, 20), enemyAtkSpeed, "Enemy Attack Speed");

		enemyAtkDamage = labelTxtField (new Rect (20, 110, labelWidth, 20), enemyAtkDamage, "Enemy Attack Damage");

		enemyAtkRange = labelTxtField (new Rect (20, 140, labelWidth, 20), enemyAtkRange, "Enemy Attack Range");

		enemyChaseSpeed = labelTxtField (new Rect (20, 170, labelWidth, 20), enemyChaseSpeed, "Enemy Walk Speed");

		enemySightRange = labelTxtField (new Rect (20, 200, labelWidth, 20), enemySightRange, "Enemy Sight Range");
		
		//if the GUI has been changed, validate each value and update parameters accordingly 
		if (GUI.changed) {

			if (float.TryParse(walkSpeed, out newWalkSpeed)){
				playerMotor.forwardSpeed = newWalkSpeed;
				playerMotor.backwardSpeed = newWalkSpeed;
				playerMotor.strafingSpeed = newWalkSpeed;
			}

			if (float.TryParse(jumpSpeed, out newJumpSpeed)){
				playerMotor.jumpSpeed = newJumpSpeed;
			}

			if (float.TryParse(enemyAtkSpeed, out newAtkSpeed)){
				enemyTest.attackSpeed = newAtkSpeed;
			}

			if (float.TryParse(enemyAtkDamage, out newAtkDamage)){
				enemyTest.attackDamage = newAtkDamage;
			}

			if (float.TryParse(enemyAtkRange, out newAtkRange)){
				enemyTest.attackRange = newAtkRange;
			}

			if (float.TryParse(enemyChaseSpeed, out newChaseSpeed)){
				enemyTest.chaseSpeed = newChaseSpeed;
			}

			if (float.TryParse(enemySightRange, out newSightRange)){
				enemyTest.viewRange = newSightRange;
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
