using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Player : MonoBehaviour 
{
    public enum ActionState
    {
        None,
        Walk,
        Run,
        Swim,
        Tiptoe,
        Wade,
        TakeDamage,
        Dead,
        DigHole,
        SetClaw,
        Shield,
        PickUp,
    }
    public float maxHealth = 100;
    public float currentHealth = 100;

    public float maxStamina = 20;
    public float currentStamina = 20;

    public List<GameItem> inventory = new List<GameItem>();
    public static Player instance;
    public ActionState currentActionState;

    void Awake()
    {
        instance = this;
    }

    public void TakeDamage(float dmgAmt)
    {
        currentActionState = ActionState.TakeDamage;
        currentHealth -= dmgAmt;

        if (currentHealth <= 0)
        {
            Die();
        }
    }

    void Die()
    {
        currentActionState = ActionState.Dead;
        //restart the level
    }

    public void CollectItem(GameItem item)
    {
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
