extends RigidBody2D

@export var deathOnSpeed: int = 30

var canDelete = false

func launch(attacker: Variant) -> void:
	print(attacker)
	var dir = attacker.global_position - global_position
	var impulseVector = Vector2(dir.normalized().x, 1) * 500
	apply_central_impulse(-impulseVector)

func _process(delta: float) -> void:
	
	
	if linear_velocity.length() < deathOnSpeed and canDelete:
		print("still")
		queue_free()

func _on_timer_timeout() -> void:
	canDelete = true
