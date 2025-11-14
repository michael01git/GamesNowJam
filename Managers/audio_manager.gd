extends Node



func play_sfx(sfx_name: String):
	pass

func play_track(track_name: String):
	pass

func play_sound_once(sound: AudioStream):
	var c = AudioStreamPlayer.new()
	self.add_child(c)
	c.stream = sound
	c.connect("finished", delete_sound_player(c))
	c.play()


func delete_sound_player(player: AudioStreamPlayer):
	player.queue_free()
