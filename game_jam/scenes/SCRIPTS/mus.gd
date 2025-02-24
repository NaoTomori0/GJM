extends AudioStreamPlayer

const game_music = preload("res://Theme .mp3")


func play_mus(music:AudioStream, vol = 0.0):
	if stream == music:
		return
		
	stream = music
	music = vol
	play()
	
	
func play_vol():
	play_mus(game_music)
