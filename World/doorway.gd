extends Area2D

@export_multiline var next_scene_path: String

func _on_body_entered(_body: Node2D) -> void:
	call_deferred("switch")

func switch():
	GameManager.switch_Scene(next_scene_path)
