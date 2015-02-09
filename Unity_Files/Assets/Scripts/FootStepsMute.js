var AudioFile: AudioClip;

function Update(){

	if (Input.GetKeyUp(KeyCode.W))
	{
		audio.clip = AudioFile;
		audio.Stop();
	}
}