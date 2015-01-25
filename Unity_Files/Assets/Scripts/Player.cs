using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Player : MonoBehaviour 
{
    //The Player class handles game logic, such as the handling of health, stamina, items, etc.
    public float maxHealth = 100;
    public float currentHealth = 100;

    public float maxStamina = 20;
    public float currentStamina = 20;

    public List<GameItem> inventory = new List<GameItem>();
    public List<GameItem> journal = new List<GameItem>();

    //The currently selected inventory item; for an empty inventory it is set to -1.
    public int selectedIndex = -1;

    public static Player instance;

    void Awake()
    {
        instance = this;
    }

    public void TakeDamage(float dmgAmt)
    {
        //Reduces our current health and updates game information
        currentHealth -= dmgAmt;
        GUI_Manager.health.text = "Health: " + currentHealth;

        if (currentHealth <= 0)
        {
            Die();
        }
    }

    void Die()
    {
        //restart the level
    }

    public void CollectItem(GameItem item)
    {
        //Picks up the item that TP_Controller is intersecting, and add it to the inventory.
        GUI_Manager.message.text = "Collected a(n): " + item.itemName + "!";
        if (item.itemType == GameItem.ItemType.Document)
            journal.Add(item);
        else
        {
            inventory.Add(item);
            selectedIndex = inventory.Count - 1;
            GUI_Manager.selectedItem.text = "Current item: " + inventory[selectedIndex].itemName;
        }
    }

    public void UseItem(int itemID)
    {
        //Use the item at the given index, usually selectedIndex

        //Do nothing if there is no item to use
        if (itemID < 0 || inventory.Count == 0)
            return;

        //Get the GameItem object at this index
        GameItem useItem = inventory[itemID];

        if (useItem.itemType == GameItem.ItemType.Consumable)
        {
            //The item is for one-time use: use the item, heal, whatever
            GUI_Manager.message.text = "Used the " + useItem.itemName + "!";
            selectedIndex = itemID - 1;
            if (selectedIndex < 0)
                GUI_Manager.selectedItem.text = "Current Item: None";
            else
                GUI_Manager.selectedItem.text = "Current Item: " + inventory[selectedIndex].itemName;
            inventory.RemoveAt(itemID);
        }
        else if (useItem.itemType == GameItem.ItemType.Tool)
        {
            //The item can be used more than once
            if (useItem.itemName == "Shovel")
            {
                if (TP_Controller.instance.activeTerrain != null)
                {
                    GUI_Manager.message.text = "Used the Shovel!";
                    TP_Controller.instance.activeTerrain.DestroyTerrain(transform.position, 3);
                }
                else
                {
                    GUI_Manager.message.text = "Couldn't use the Shovel!";
                }
            }
            else if (useItem.itemName == "Snapper")
            {
                if (TP_Controller.instance.activeFault != null)
                {
                    GUI_Manager.message.text = "Used the Snapper!";
                    TP_Controller.instance.activeFault.Activate();
                }
                else
                {
                    GUI_Manager.message.text = "Couldn't use the Snapper!";
                }
            }
            else if (useItem.itemName == "Shield")
            {
                //we are using the Shield
            }
        }
    }

    public void CycleItems(bool left)
    {
        //change the currently selected item and update the GUI
        if (inventory.Count == 0)
            return;

        if (left)
        {
            selectedIndex--;
            if (selectedIndex < 0)
                selectedIndex = inventory.Count - 1;
        }
        else
        {
            selectedIndex++;
            if (selectedIndex >= inventory.Count)
                selectedIndex = 0;
        }
        GUI_Manager.selectedItem.text = "Current item: " + inventory[selectedIndex].itemName;
    }
}
