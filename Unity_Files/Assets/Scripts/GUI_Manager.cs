using UnityEngine;
using System.Collections;

public class GUI_Manager : MonoBehaviour 
{
    public static GUIText health;
    public static GUIText stamina;
    public static GUIText charState;
    public static GUIText selectedItem;
    public static GUIText message;
    public static GUITexture screenFader;

	void Awake () {
        //Grab each of the children in the GUI Manager object and assign them a value to be used throughout the rest of the game data
        foreach (Transform child in transform)
        {
            switch (child.name)
            {
                case "GUI_Health":
                    health = child.guiText;
                    break;
                case "GUI_Stamina":
                    stamina = child.guiText;
                    break;
                case "GUI_CharState":
                    charState = child.guiText;
                    break;
                case "GUI_SelectedItem":
                    selectedItem = child.guiText;
                    break;
                case "GUI_Message":
                    message = child.guiText;
                    break;
                case "GUI_Fader":
                    screenFader = child.guiTexture;
                    screenFader.pixelInset = new Rect(0f, 0f, Screen.width, Screen.height);
                    break;
                default:
                    break;
            }
        }
	}
}
