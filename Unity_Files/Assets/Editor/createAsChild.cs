using UnityEngine;
using UnityEditor;

public class MinorFixes : MonoBehaviour {
	
	[MenuItem("GameObject/Add Empty Child #&c")]
	static void AddEmptyChild() {
		GameObject go = new GameObject("EmptyChild:NameMe");
		if(Selection.activeTransform != null)
		{
			go.transform.parent = Selection.activeTransform;
			go.transform.Translate(Selection.activeTransform.position);
		}
		Selection.activeTransform = go.transform;
	}
	
	[MenuItem("GameObject/Wrap in Object #&w")]
	static void WrapInObject() {
		if(Selection.gameObjects.Length == 0)
			return;
		
		GameObject go = new GameObject("Wrapper:NameMe");
		go.transform.parent = Selection.activeTransform.parent;
		go.transform.position = Vector3.zero;
		foreach(GameObject g in Selection.gameObjects) {
			g.transform.parent = go.transform;
		}
	}
}