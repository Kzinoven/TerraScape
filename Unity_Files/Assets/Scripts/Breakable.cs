using UnityEngine;
using System.Collections;

public class Breakable : MonoBehaviour
{
    bool isBroken;

    void Awake()
    {
        isBroken = false;
    }

    public void BreakApart()
    {
        isBroken = true;
        //apply some force or animation to this object
        //if it's a force, the unity physics engine will handle it
        //if it's an animation, Update() will need to check if it is still playing and delete the collider/destroy the object
    }

    void Update()
    {
        /*
        if (!animation.isPlaying && isBroken)
        {
            //the object has broken and the animation has stopped
            //Destroy or fade out the object
        }
        */
    }
}