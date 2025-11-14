extends Control

@export var next_scene_button: Button
@export_multiline var next_scene_path: String
@export var optional_theme: AudioStream
@export var stop_music: bool = false

func _ready() -> void:
	if stop_music:
		AudioManager.stop_track()
	else:
		AudioManager.play_track(optional_theme)
	
	if next_scene_button != null:
		next_scene_button.connect("pressed", change_scene)

func change_scene():
	PlayerStatsManager.reset_stats()
	GameManager.switch_Scene(next_scene_path)
