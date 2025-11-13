extends CharacterBody2D

@onready var deathRoll: PackedScene = preload("res://Characters/Enemies/ridgidbody.tscn")
@export var gravity = 4000

func _process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()

func _on_health_component_death(attacker: Variant) -> void:
	print(attacker)
	
	var c = deathRoll.instantiate()
	c.global_position = global_position
	get_parent().add_child(c)
	c.launch(attacker)
	
	queue_free()
