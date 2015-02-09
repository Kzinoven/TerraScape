var AudioFile : AudioClip;

function Update() {

	if (Input.GetKeyDown (KeyCode.E))
	{
		audio.clip = AudioFile;
		audio.Play();
		
	}
		
}