using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Player : MonoBehaviour 
{
    public float maxHealth = 100;
    public float currentHealth = 100;

    public float maxStamina = 20;
    public float currentStamina = 20;

    public List<GameItem> inventory = new List<GameItem>();
    public List<GameItem> journal = new List<GameItem>();

    public int selectedIndex = -1;

    public static Player instance;

    void Awake()
    {
        instance = this;
    }

    public void TakeDamage(float dmgAmt)
    {
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
        GUI_Manager.message.text = "Collected a(n): " + item.itemName + "!";
        if (item.itemType == GameItem.ItemType.Document)
            journal.Add(item);
        else
        {
            inventory.Add(item);
            selectedIndex = inventory.Count - 1;
        }
    }

    public void UseItem(int itemID)
    {
        if (itemID < 0 || inventory.Count == 0)
            return;

        GameItem useItem = inventory[itemID];

        if (useItem.itemType == GameItem.ItemType.Consumable)
        {
            //use the item, heal, whatever
            inventory.RemoveAt(itemID);
        }
        else if (useItem.itemType == GameItem.ItemType.Tool)
        {
            if (useItem.itemName == "Shovel")
            {

            }
            else if (useItem.itemName == "Snapper")
            {

            }
            else if (useItem.itemName == "Shield")
            {

            }
        }
    }
}
