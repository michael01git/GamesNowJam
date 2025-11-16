extends State
class_name IdleState

@onready var move_state: MoveState = $"../MoveState"
@onready var attack_state: AttackState = $"../AttackState"
@onready var air_state: AirState = $"../AirState"

func state_input(event: InputEvent) -> void:
	animate()
	if event.is_action_pressed("attack"):
		next_state = attack_state
	elif event.is_action("jump") and player.is_on_floor():
		player.velocity.y = -player.jump_speed
		next_state = air_state
	elif event.is_action("left") or event.is_action("right"):
		next_state = move_state

func animate():
	if !Input.is_anything_pressed() and player.is_on_floor() and abs(player.velocity.x) < 0.1:
		animated_sprite_2d.pause()
