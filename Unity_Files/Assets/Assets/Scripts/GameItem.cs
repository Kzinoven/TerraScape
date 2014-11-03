using UnityEngine;
using System.Collections;

[System.Serializable]
public class GameItem : MonoBehaviour
{
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
}