extends State
class_name MoveState

@onready var idle_state: IdleState = $"../IdleState"
@onready var air_state: Node = $"../AirState"
@onready var attack_state: AttackState = $"../AttackState"

func state_input(event: InputEvent):
	if event.is_action_pressed("ground_attack"):
		next_state = attack_state

func state_process(delta: float):
	
	
	var dir = Input.get_axis("left", "right")
	if dir != 0:
		player.velocity.x = lerp(player.velocity.x, dir * player.speed, player.acceleration)
	else:
		player.velocity.x = lerp(player.velocity.x, 0.0, player.friction)
	
	player.move_and_slide()
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = -player.jump_speed
	
	if !player.is_on_floor():
		next_state = air_state
	elif dir == 0 and player.velocity == Vector2.ZERO:
		next_state = idle_state
