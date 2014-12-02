using UnityEngine;
using System.Collections;

public class LevelExit : MonoBehaviour
{
    #region fields

    #endregion

    #region properties

    #endregion

    #region functions
    void OnTriggerEnter(Collider collider)
    {
        Application.Quit();
    }
    #endregion
}