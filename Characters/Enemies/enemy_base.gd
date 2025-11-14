extends CharacterBody2D

@onready var culler: CollisionShape2D = get_tree().get_first_node_in_group("CullPoint")


@export var gravity = 4000
@export var damage_amount: int = 1
@export var do_cull: bool = true
@export var cullExtraDistance: int = 1000


func _process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()
	
	if do_cull:
		cull()

func cull():
	if (global_position.x+cullExtraDistance) < culler.global_position.x:
		queue_free()

func _on_health_component_death(attacker: Variant) -> void:
	print(attacker)
	queue_free()
