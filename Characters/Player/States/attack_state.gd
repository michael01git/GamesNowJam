extends State
class_name AttackState

@export var attack_shape: Shape2D
@export var time_to_attack: float = 0.1
@export var attack_cooldown: float = 0.1

@onready var move_state: MoveState = $"../MoveState"
@onready var pink: AnimationPlayer = $Pink

func state_input(event: InputEvent):
	if event.is_action("jump") and player.is_on_floor():
		player.velocity.y = -player.jump_speed


func set_area_shape():
	attack_area.get_child(0).shape = attack_shape
	attack_area.position.x = attack_shape.size.x/2.0

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func on_enter():
	pink.play("attack")
	animated_sprite_2d.play("attack")
	
	set_area_shape()
	await wait(time_to_attack) # We charge up a bit.
	
	#Deal damage to enemies
	for i in attack_area.get_overlapping_bodies():
		for c in i.get_children():
			if c.is_in_group("HealthComponent"):
				c.dealt_damage(player, player.damage)
				break
	
	print("CD")
	await wait(attack_cooldown) # cooldown
	print("CO")
	
	next_state = move_state
