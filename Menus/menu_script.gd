extends Control

@export var next_scene_button: Button
@export var next_scene_path: String

func _ready() -> void:
	if next_scene_button != null:
		next_scene_button.connect("pressed", change_scene)

func change_scene():
	PlayerStatsManager.reset_stats()
	GameManager.switch_Scene(next_scene_path)
