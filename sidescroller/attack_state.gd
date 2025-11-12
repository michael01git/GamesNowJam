extends State
class_name AttackState

@export var attack_shape: Shape2D
@onready var move_state: MoveState = $"../MoveState"

func set_area_shape():
	attack_area.get_child(0).shape = attack_shape
	attack_area.position.x = attack_shape.size.x/2.0

func wait(time: int):
	# In millis.
	await get_tree().create_timer(time).timeout

func on_enter():
	set_area_shape()
	wait(10)
	
	for i in attack_area.get_overlapping_bodies():
		i.hurt()
	
	wait(10)
	
	next_state = move_state
