extends State
class_name MoveState

@onready var idle_state: IdleState = $"../IdleState"
@onready var air_state: Node = $"../AirState"
@onready var attack_state: AttackState = $"../AttackState"

func state_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		next_state = attack_state

func state_process(delta: float):
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = -player.jump_speed
	
	if !player.is_on_floor():
		next_state = air_state
	elif player.velocity == Vector2.ZERO:
		next_state = idle_state
