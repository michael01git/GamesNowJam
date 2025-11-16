extends State
class_name MoveState

@onready var idle_state: IdleState = $"../IdleState"
@onready var air_state: Node = $"../AirState"
@onready var attack_state: AttackState = $"../AttackState"
@onready var hurt_state: HurtState = $"../HurtState"

func state_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		next_state = attack_state

func state_process(delta: float):
	
	animate()
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = -player.jump_speed
	
	if !player.is_on_floor():
		next_state = air_state
	elif player.velocity == Vector2.ZERO:
		next_state = idle_state

func animate(): ## Right manages hurt anim length
	if hurt_state.invulnerable and hurt_state.time_left > 0.25:
		pass
	elif animated_sprite_2d.is_playing() and animated_sprite_2d.animation == "attack":
		pass
	elif (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		animated_sprite_2d.play("walk")
	elif !Input.is_anything_pressed() and player.is_on_floor() and abs(player.velocity.x) < 0.1:
		animated_sprite_2d.pause()
