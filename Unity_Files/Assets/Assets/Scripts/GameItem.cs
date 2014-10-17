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
    public int itemID;
    public string itemDesc;
    //will we have icons for the various items?
    //public Texture2D itemIcon;
    public ItemType itemType;

    public GameItem(string name, int id, string desc, ItemType type)
    {
        itemName = name;
        itemID = id;
        itemDesc = desc;
        itemType = type;
    }
}