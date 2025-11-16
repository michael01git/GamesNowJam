extends State
class_name HurtState


@export_multiline var death_scene: String
@export var invCooldown: float = 1

var hurtBy: Node
var hurtAmount: int

var invulnerable: bool = false
var time_left: float = 0

@onready var move_state: MoveState = $"../MoveState"
@onready var red: AnimationPlayer = $Red

func base(by: Node, amount: int):
	hurtBy = by
	hurtAmount = amount

func on_enter():
	red.play("hurt")
	animated_sprite_2d.play("hurt")
	
	PlayerStatsManager.add_to_stat("health", -hurtAmount)
	if PlayerStatsManager.get_stat("health") <= 0:
		GameManager.switch_Scene(death_scene)
	
	start_cooldown()
	next_state = move_state

func _process(delta: float) -> void:
	if invulnerable:
		
		time_left -= delta
		if time_left <= 0:
			time_left = 0
			invulnerable = false

func start_cooldown():
	invulnerable = true
	time_left = invCooldown
