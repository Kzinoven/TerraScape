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
    public static Player instance;

    void Awake()
    {
        instance = this;
    }

    public void TakeDamage(float dmgAmt)
    {
        currentHealth -= dmgAmt;

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
        Debug.Log("Collected a(n): " + item.itemName + "!");
        inventory.Add(item);
    }

    public void UseItem(int itemID)
    {
        GameItem useItem = inventory[itemID];

        if (useItem.itemType == GameItem.ItemType.Consumable)
        {
            //use the item, heal, whatever
            inventory.RemoveAt(itemID);
        }
        else if (useItem.itemType == GameItem.ItemType.Tool)
        {
            //equip the tool
        }
        else if (useItem.itemType == GameItem.ItemType.Document)
        {
            //view the document in the menu
        }
    }
}
