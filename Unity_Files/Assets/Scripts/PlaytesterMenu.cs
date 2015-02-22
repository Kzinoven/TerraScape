using UnityEngine;
using System.Collections;

public class PlaytesterMenu : MonoBehaviour {
	public bool menuOpen = false;
	public GUITexture textureOverlay;
	public int overlayDepth = 1;

	public ThirdPersonController player;
	public PlayerSlider slider;
	public Player playerStats;

	public BasicEnemyAI drEnemy;

	private string[] categories = {"Player", "Dune Roamer"};

	private int currentCategory = 0;

	public GUIStyle headerStyle;


	#region Editor Variables
	string walkSpeed,
	runSpeed,
	jumpHeight,
	
	startSlideSpeed,
	startSlideAngle,
	maxSlideSpeed,
	turnSpeed,
	turnForce,
	
	maxHealth,
	maxStamina,
	staminaRegen,
	
	drHealth,
	drWalkSpeed,
	drChargeSpeed,
	drRollSpeed,
	drRollTurnSpeed,
	
	drAttackDamage,
	drRollDamage,
	drAttackRange,
	drRollRange,
	drDetectRange;
	
	float newWalkSpeed,
	newRunSpeed,
	newJumpHeight,
	
	newStartSlideSpeed,
	newStartSlideAngle,
	newMaxSlideSpeed,
	newTurnSpeed,
	newTurnForce,
	
	newMaxHealth,
	newMaxStamina,
	newStaminaRegen,
	
	newDRHealth,
	newDRWalkSpeed,
	newDRChargeSpeed,
	newDRRollSpeed,
	newDRRollTurnSpeed,
	
	newDRAttackDamage,
	newDRRollDamage,
	newDRAttackRange,
	newDRRollRange,
	newDRDetectRange;
	#endregion


	// Use this for initialization
	void Start () {
		player = GameObject.FindWithTag ("Player").GetComponent<ThirdPersonController>();
		playerStats = GameObject.FindWithTag ("Player").GetComponent<Player> ();
		if (player == null) {
			throw new UnityException("No player object in this scene.");
		}

		drEnemy = GameObject.Find ("shieldCreature_inProgress_v5_unsmoothed_walk").GetComponent<BasicEnemyAI> ();

		//make the overlay the same size as the screen
		textureOverlay.transform.position = new Vector3(0, 0, overlayDepth);
		textureOverlay.pixelInset = new Rect(0, 0, Screen.width, Screen.height);
		textureOverlay.enabled = false;

		#region initialize editor variables
		walkSpeed = player.walkSpeed.ToString();
		runSpeed = player.runSpeed.ToString();
		jumpHeight = player.jumpHeight.ToString();
		startSlideSpeed = player.initSlideSpeed.ToString();
		startSlideAngle = player.initSlideAngle.ToString();
		maxSlideSpeed = slider.maxSpeed.ToString();
		turnSpeed = slider.rotateSpeed.ToString();
		turnForce = slider.turnForce.ToString();
		maxHealth = playerStats.maxHealth.ToString();
		maxStamina = playerStats.maxStamina.ToString();
		staminaRegen = playerStats.staminaRegen.ToString();
		drHealth = drEnemy.MaxHealth.ToString();
		drWalkSpeed = drEnemy.walkSpeed.ToString();
		drChargeSpeed = drEnemy.chargeSpeed.ToString();
		drRollSpeed = drEnemy.rollSpeed.ToString();
		drRollTurnSpeed = drEnemy.rollRotationSpeed.ToString();
		drAttackDamage = drEnemy.attackDamage.ToString();
		drRollDamage = drEnemy.rollDamage.ToString();
		drAttackRange = drEnemy.attackRange.ToString();
		drRollRange = drEnemy.rollRange.ToString();
		drDetectRange = drEnemy.viewRange.ToString();
		#endregion
	}
	
	// Update is called once per frame
	void Update () {
		//toggle GUI with Escape
		if(Input.GetKeyDown(KeyCode.Escape))
		{
			if(menuOpen)
			{
				updateValues();
				menuOpen = false;
				textureOverlay.enabled = false;
				Time.timeScale = 1;
			}
			else
			{
				menuOpen=true;
				textureOverlay.enabled = true;
				Time.timeScale = 0;
			}
		}
	}
	
	//create GUI elements in here
	void OnGUI (){

		if (!menuOpen) 
		{return;}



		//create toolbar for switching between categories
		currentCategory = GUI.Toolbar(new Rect (20, 20, 250, 40), currentCategory, categories);

		GUILayout.BeginArea(new Rect(20, 70, Screen.width - 40, Screen.height - 90));
		GUILayout.BeginVertical();

		switch (categories[currentCategory])
		{
		case "Player":
				GUILayout.Label("Walking", headerStyle);
				walkSpeed = labelTxtField(walkSpeed, "Walk Speed");
				runSpeed = labelTxtField(runSpeed, "Run Speed");
				jumpHeight = labelTxtField(jumpHeight, "Jump Height");

				GUILayout.Label("Sliding", headerStyle);
				startSlideSpeed = labelTxtField(startSlideSpeed, "Initial Slide Speed");
				startSlideAngle = labelTxtField(startSlideAngle, "Initial Slide Angle");
				maxSlideSpeed = labelTxtField(maxSlideSpeed, "Maximum Slide Speed");
				turnSpeed = labelTxtField(turnSpeed, "Sliding Turn Speed");
				turnForce = labelTxtField(turnForce, "Turning Force");

				GUILayout.Label("Stats", headerStyle);
				maxHealth = labelTxtField(maxHealth, "Maximum Health");
				maxStamina = labelTxtField(maxStamina, "Maximum Stamina");
				staminaRegen = labelTxtField(staminaRegen, "Stamina Regen");
			break;

		case "Dune Roamer":
				GUILayout.Label("Stats", headerStyle);
				drHealth = labelTxtField(drHealth, "Health");
				drWalkSpeed = labelTxtField(drWalkSpeed, "Walk Speed");
				drChargeSpeed = labelTxtField(drChargeSpeed, "Charge Speed");
				drRollSpeed = labelTxtField(drRollSpeed, "Roll Speed");
				drRollTurnSpeed = labelTxtField(drRollTurnSpeed, "Roll Turn Speed");

				GUILayout.Label("Combat", headerStyle);
				drAttackDamage = labelTxtField(drAttackDamage, "Headbutt Damage");
				drRollDamage = labelTxtField(drRollDamage, "Roll Damage");
				drAttackRange = labelTxtField(drAttackRange, "Charge Range");
				drRollRange = labelTxtField(drRollRange, "Approach Range");
				drDetectRange = labelTxtField(drDetectRange, "Detection Range");
			break;
		}

		GUILayout.EndVertical();
		GUILayout.EndArea();
	}

	//update the values with the new values in GUI - only called when closing GUI
	void updateValues()
	{
		if (float.TryParse(walkSpeed, out newWalkSpeed)){
			player.walkSpeed = newWalkSpeed;
		} else {
			walkSpeed = player.walkSpeed.ToString();
		}
		
		if (float.TryParse(runSpeed, out newRunSpeed)){
			player.runSpeed = newRunSpeed;
		} else {
			runSpeed = player.runSpeed.ToString();
		}

		if (float.TryParse(jumpHeight, out newJumpHeight)){
			player.jumpHeight = newJumpHeight;
		} else {
			jumpHeight = player.jumpHeight.ToString();
		}




		if (float.TryParse(startSlideSpeed, out newStartSlideSpeed)){
			player.initSlideSpeed = newStartSlideSpeed;
		} else {
			startSlideSpeed = player.initSlideSpeed.ToString();
		}

		if (float.TryParse(startSlideAngle, out newStartSlideAngle)){
			player.initSlideAngle = newStartSlideAngle;
		} else {
			startSlideAngle = player.initSlideAngle.ToString();
		}

		if (float.TryParse(maxSlideSpeed, out newMaxSlideSpeed)){
			slider.maxSpeed = newMaxSlideSpeed;
		} else {
			maxSlideSpeed = slider.maxSpeed.ToString();
		}

		if (float.TryParse(turnSpeed, out newTurnSpeed)){
			slider.rotateSpeed = newTurnSpeed;
		} else {
			turnSpeed = slider.rotateSpeed.ToString();
		}
		if (float.TryParse(turnForce, out newTurnForce)){
			slider.turnForce = newTurnForce;
		} else {
			turnForce = slider.turnForce.ToString();
		}




		if (float.TryParse(maxHealth, out newMaxHealth) && newMaxHealth != playerStats.maxHealth){
			playerStats.currentHealth = newMaxHealth;
			playerStats.maxHealth = newMaxHealth;
		} else {			
			maxHealth = playerStats.maxHealth.ToString();
		}

		if (float.TryParse(maxStamina, out newMaxStamina)){
			playerStats.maxStamina = newMaxStamina;
		} else {
			maxStamina = playerStats.maxStamina.ToString();
		}

		if (float.TryParse(staminaRegen, out newStaminaRegen)){
			playerStats.staminaRegen = newStaminaRegen;
		} else {
			staminaRegen = playerStats.staminaRegen.ToString();
		}




		if (float.TryParse(drHealth, out newDRHealth)){
			drEnemy.MaxHealth = newDRHealth;
		} else {
			drHealth = drEnemy.MaxHealth.ToString();
		}

		if (float.TryParse(drWalkSpeed, out newDRWalkSpeed)){
			drEnemy.walkSpeed = newDRWalkSpeed;
		} else {
			drWalkSpeed = drEnemy.walkSpeed.ToString();
		}

		if (float.TryParse(drChargeSpeed, out newDRChargeSpeed)){
			drEnemy.chargeSpeed = newDRChargeSpeed;
		} else {
			drChargeSpeed = drEnemy.chargeSpeed.ToString();
		}

		if (float.TryParse(drRollSpeed, out newDRRollSpeed)){
			drEnemy.rollSpeed = newDRRollSpeed;
		} else {
			drRollSpeed = drEnemy.rollSpeed.ToString();
		}

		if (float.TryParse(drRollTurnSpeed, out newDRRollTurnSpeed)){
			drEnemy.rollRotationSpeed = newDRRollTurnSpeed;
		} else {
			drRollTurnSpeed = drEnemy.rollRotationSpeed.ToString();
		}




		if (float.TryParse(drAttackDamage, out newDRAttackDamage)){
			drEnemy.attackDamage = newDRAttackDamage;
		} else {
			drAttackDamage = drEnemy.attackDamage.ToString();
		}

		if (float.TryParse(drRollDamage, out newDRRollDamage)){
			drEnemy.rollDamage = newDRRollDamage;
		} else {
			drRollDamage = drEnemy.rollDamage.ToString();
		}

		if (float.TryParse(drAttackRange, out newDRAttackRange)){
			drEnemy.attackRange = newDRAttackRange;
		} else {
			drAttackRange = drEnemy.attackRange.ToString();
		}

		if (float.TryParse(drRollRange, out newDRRollRange)){
			drEnemy.rollRange = newDRRollRange;
		} else {
			drRollRange = drEnemy.rollRange.ToString();
		}

		if (float.TryParse(drDetectRange, out newDRDetectRange)){
			drEnemy.viewRange = newDRDetectRange;
		} else {
			drDetectRange = drEnemy.viewRange.ToString();
		}
	}

	//create a label with a text field next to it using automatic layout
	string labelTxtField(string value, string labelText){
		GUILayout.BeginHorizontal();
		GUILayout.Label (labelText);

		value = GUILayout.TextField (value);
		GUILayout.EndHorizontal();
		return value;
	}
}
