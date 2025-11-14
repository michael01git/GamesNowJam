@tool
extends Node

@onready var sound: PackedScene = preload("res://World/Sound/sound_player.tscn")
@onready var switch_track_animation: AnimationPlayer = $SwitchTrackAnimation
@onready var track_player: AudioStreamPlayer = $TrackPlayer

var next_track: AudioStream

## Play [sfx_name] once.
func play_sfx(sfx: AudioStream):
	play_sound_once(sfx)

## Switch current track to [track_name].
func play_track(track: AudioStream):
	if track != null:
		track_player.stream = track
		track_player.play()
		#switch_track_animation.play("switch")

func stop_track():
	track_player.stop()

func play_next_track():
	print("nexttrack")
	track_player.play()

func play_sound_once(sound_to_play: AudioStream):
	var c = sound.instantiate()
	self.add_child(c)
	c.connect("finished", c.queue_free)
	c.play_sound(sound_to_play)

func delete_sound_player(player: AudioStreamPlayer):
	player.queue_free()
