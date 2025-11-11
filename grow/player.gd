extends CharacterBody2D

const SPEED = 100000

func _process(delta: float) -> void:
	var input = get_input()
	velocity = input * SPEED * delta
	move_and_slide()

func get_input() -> Vector2:
	var input: Vector2 = Vector2.ZERO
	input.x = Input.get_axis("left", "right")
	input.y = Input.get_axis("up", "down")
	return input.normalized()

func grow():
	scale *= 2 
	$Camera2D.zoom /= 1.5
