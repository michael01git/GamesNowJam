extends Area2D

var dir: Vector2
var speed: float = 1000
var damage_amount: int = 1

func fire(player_pos: Vector2) -> void:
	dir = player_pos - global_position
	dir = dir.normalized()
	look_at(player_pos)

func _process(delta: float) -> void:
	if get_overlapping_bodies().is_empty():
		global_position += dir * delta * speed
	else:
		queue_free()
