using UnityEngine;
using System.Collections;
//I believe you just have to throw this onto the an empty game object with a black GUItexture component. I made it from a tutorial and then tweaked some stuff of it.
public class screenFade : MonoBehaviour 
{
	public float fadeSpeed = 1.5f;
	private bool sceneStarting = true;
    private bool sceneEnding = false;

	void Update()
	{
		if(sceneStarting)
		{
			StartScene();
		}

        if (sceneEnding)
        {
            EndScene();
        }
	}

    void OnTriggerEnter(Collider collider)
    {
        sceneEnding = true;
    }

	public void FadeToClear()
	{
        GUI_Manager.screenFader.color = Color.Lerp(GUI_Manager.screenFader.color, Color.clear, fadeSpeed * Time.deltaTime);
	}

	public void FadeToBlack()
	{
        GUI_Manager.screenFader.color = Color.Lerp(GUI_Manager.screenFader.color, Color.black, fadeSpeed * Time.deltaTime);
	}

	void StartScene()
	{
		FadeToClear ();
        if (GUI_Manager.screenFader.color.a <= 0.05f)
		{
            GUI_Manager.screenFader.color = Color.clear;
            GUI_Manager.screenFader.enabled = false;
			sceneStarting = false;
		}
	}
	public void EndScene()
	{
        GUI_Manager.screenFader.enabled = true;
		FadeToBlack ();

        if (GUI_Manager.screenFader.color.a >= 0.95f)
		{
			Application.LoadLevel(0); //You could load a winscreen or something if you wanted here.
		}
	}
}
