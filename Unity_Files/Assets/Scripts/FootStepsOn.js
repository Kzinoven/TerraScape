     var AudioFile: AudioClip;
     
     function Update() {
     
     if (Input.GetKeyDown (KeyCode.W))
    {
    audio.clip = AudioFile;
    audio.Play();
     
    }
     

} 