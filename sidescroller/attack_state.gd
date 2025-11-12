extends State
class_name AttackState

@onready var idle_state: IdleState = $"../IdleState"
@onready var move_state: MoveState = $"../MoveState"

func state_process(delta: float) -> void:
	
	var dir = Input.get_axis("left", "right")
	if dir != 0:
		player.velocity.x = lerp(player.velocity.x, dir * player.speed, player.acceleration)
	else:
		player.velocity.x = lerp(player.velocity.x, 0.0, player.friction)
	
	player.move_and_slide()
	
	if player.is_on_floor():
		if player.velocity == Vector2.ZERO:
			next_state = idle_state
		else:
			next_state = move_state
	
