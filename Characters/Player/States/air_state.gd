extends State
class_name AirState

@onready var idle_state: IdleState = $"../IdleState"
@onready var move_state: MoveState = $"../MoveState"
@onready var attack_state: AttackState = $"../AttackState"

func state_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		next_state = attack_state


func state_process(delta: float) -> void:
	
	if player.is_on_floor():
		if player.velocity == Vector2.ZERO:
			next_state = idle_state
		else:
			next_state = move_state
	
