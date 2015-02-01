using UnityEngine;
using System.Collections;
[RequireComponent(typeof (Animator))]

public class animationController : MonoBehaviour {
	public float speed = 0.0f;
	public bool jump = false;
	public bool wall = false;
	public bool shimmy  = false;
	public float direction = 0f;
	public int reset = 0;
	public Transform ledge;
	private Animator anim;

	// Use this for initialization
	void Start () {
		anim = GetComponent<Animator>();
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown("space")){
			jump = true;
			print("is she jumping?");
			reset = 0;
		}
		reset += 1;
		if (reset >= 2){
			jump = false;
		}
		if (Input.GetKeyDown("u")){
			if (wall == true){
				wall = false;
				print("the wall is gone!");
			}
			else {
				wall = true;
				Instantiate(ledge, new Vector3(0.4876829f, 1.548573f, -8.050492f), new Quaternion(0f,0f,52.46471f,0f));
				print("imagine there's a wall here.");
			}
		}
		if (Input.GetKey("w")){
			if (speed<=40){
				speed += 1;
				print("building up speed");
			}
			else{
				print("max walk speed");
			}
		}
		else{
			speed-=2;
		}
		if (Input.GetKey(KeyCode.LeftShift) && (speed>=1) && (speed<=50)){
			speed += 1;
			print("running");
		}
		if (Input.GetKey("d")){
			shimmy = true;
			direction = 1;
			print("shimmy right");
		}
		else if (Input.GetKey("a")){
			shimmy = true;
			direction = -1;
			print("shimmy left");
		}
		else {
			direction = 0;
			shimmy = false;
		}
		if (speed<=0){
			speed = 0;
		}

		reset += 1;
		anim.SetFloat("direction", direction);
		anim.SetFloat("speed", speed);
		anim.SetBool("wall", wall);
		anim.SetBool("shimmy", shimmy);
		anim.SetBool("jump", jump);
	}
}
