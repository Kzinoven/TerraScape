using UnityEngine;
using System.Collections;

public class PlaytesterMenu : MonoBehaviour {
	bool enabled = false;
	public GUITexture textureOverlay;
	public int overlayDepth = 1;

	public ThirdPersonController player;
	public Player playerStats;

	public BasicEnemyAI enemyTest;

	// Use this for initialization
	void Start () {
		player = GameObject.FindWithTag ("Player").GetComponent<ThirdPersonController>();
		playerStats = GameObject.FindWithTag ("Player").GetComponent<Player> ();
		if (player == null) {
			throw new UnityException("No player object in this scene.");
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
				updateValues();
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
	string walkSpeed = "7";
	string runSpeed = "15";
	string jumpHeight = "0.5";
	string enemyAtkSpeed = "0.3";
	string enemyAtkDamage = "20";
	string enemyChaseSpeed = "5";
	string enemySightRange = "20";
	string maxStamina = "50";
	string staminaRegen = "3";
	float labelWidth = 150;

	float newWalkSpeed;
	float newJumpSpeed;
	float newAtkSpeed;
	float newAtkDamage;
	float newAtkRange;
	float newChaseSpeed;
	float newSightRange;
	float newMaxStamina;
	float newStaminaRegen;
	#endregion
	//create GUI elements in here
	void OnGUI (){
		if (!enabled) 
		{return;}

		walkSpeed = labelTxtField (new Rect (20, 20, labelWidth, 20), walkSpeed, "Walk Speed");

		runSpeed = labelTxtField (new Rect (20, 50, labelWidth, 20), runSpeed, "Run Speed");

		jumpHeight = labelTxtField (new Rect (20, 80, labelWidth, 20), jumpHeight, "Jumping Height");

		enemyAtkSpeed = labelTxtField (new Rect (20, 110, labelWidth, 20), enemyAtkSpeed, "Enemy Attack Speed");

		enemyAtkDamage = labelTxtField (new Rect (20, 140, labelWidth, 20), enemyAtkDamage, "Enemy Attack Damage");

		enemyChaseSpeed = labelTxtField (new Rect (20, 170, labelWidth, 20), enemyChaseSpeed, "Enemy Walk Speed");

		enemySightRange = labelTxtField (new Rect (20, 200, labelWidth, 20), enemySightRange, "Enemy Sight Range");

		maxStamina = labelTxtField(new Rect (20 + labelWidth * 2 + 20, 20, labelWidth, 20), maxStamina, "Max Player Stamina");

		staminaRegen = labelTxtField(new Rect(20 + labelWidth * 2 + 20, 50, labelWidth, 20), staminaRegen, "Player Stamina Regen");
	}

	//update the values with the new values in GUI - only called when closing GUI
	void updateValues()
	{
		if (float.TryParse(walkSpeed, out newWalkSpeed)){
			player.walkSpeed = newWalkSpeed;
		}
		
		if (float.TryParse(jumpHeight, out newJumpSpeed)){
			player.jumpHeight = newJumpSpeed;
		}
		
		if (float.TryParse(enemyAtkSpeed, out newAtkSpeed)){
			enemyTest.attackSpeed = newAtkSpeed;
		}
		
		if (float.TryParse(enemyAtkDamage, out newAtkDamage)){
			enemyTest.attackDamage = newAtkDamage;
		}
		
		if (float.TryParse(enemyChaseSpeed, out newChaseSpeed)){
			enemyTest.chaseSpeed = newChaseSpeed;
		}
		
		if (float.TryParse(enemySightRange, out newSightRange)){
			enemyTest.viewRange = newSightRange;
		}
		
		if (float.TryParse(maxStamina, out newMaxStamina))
		{
			playerStats.maxStamina = newMaxStamina;
		}
		
		if (float.TryParse(staminaRegen, out newStaminaRegen)){
			playerStats.staminaRegen = newStaminaRegen;
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
