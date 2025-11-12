extends State
class_name IdleState

@onready var move_state: MoveState = $"../MoveState"

func state_input(event: InputEvent) -> void:
	if event.is_action("left") or event.is_action("right") or event.is_action("jump"):
		next_state = move_state

func state_process(delta: float):
	return
	player.move_and_slide()
	#if Input.is_anything_pressed():
	#	next_state = move_state
