using UnityEngine;
using System.Collections;

[System.Serializable]
public class GameItem : MonoBehaviour
{
	public GameObject player;
	private Collider target;
    public enum ItemType
    {
        Consumable,
        Tool,
        Document,
    }
    public string itemName;
    public string itemDesc;
    //will we have icons for the various items?
    //public Texture2D itemIcon;
    public ItemType itemType;

    public GameItem(string name, string desc, ItemType type)
    {
        //initialise with constructor
        itemName = name;
        itemDesc = desc;
        itemType = type;
    }

	void Start () {
		player = GameObject.FindGameObjectWithTag ("Player");
		target = player.GetComponent<CharacterController>();
	}

	void OnTriggerStay(Collider other) {
		GUI_Manager.message.text = "Press Q to pick up the " + itemName;
		if (other != target) //The colliding object isn't our object
		{
			//Debug.Log("something's wrong");
			return; //don't do anything if it's not our target
		}
		else {
			if(Input.GetKeyDown(KeyCode.Q)){
				player.GetComponent<Player>().CollectItem(this.GetComponent<GameItem>());
				Destroy (gameObject, 0);
			}
		}
	}
	void OnTriggerExit(Collider other){
		GUI_Manager.message.text = "Message";
	}
}