extends AudioStreamPlayer

func play_music(audio_clip : AudioClip):
	stream = audio_clip.file
	volume_db = audio_clip.volume
	pitch_scale = audio_clip.custom_pitch
	play()
