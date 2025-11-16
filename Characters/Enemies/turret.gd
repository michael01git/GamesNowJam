extends Node2D
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var ray_cast_2d: RayCast2D = $RayCast2D

@export var animation: AnimatedSprite2D

@export var bullet: PackedScene
@export var coolDownPeriod: float = 1
@export var timeToFire: float = 0.7
var canFire: bool = true
var time: float = 0
var timeSeen: float = 0

func _process(delta: float) -> void:
	ray_cast_2d.target_position = player.global_position - global_position
	
	if ray_cast_2d.is_colliding():
		animation.set_frame_and_progress(0, 0)
		timeSeen = 0
		return
	
	timeSeen += delta
	if timeToFire > timeSeen:
		return
	
	if canFire:
		canFire = false
		fire()
		
	else:
		time += delta
		
		if time > coolDownPeriod:
			canFire = true
			time = 0

func fire():
	if animation != null:
		animation.play("shoot")
	
	var c = bullet.instantiate()
	get_parent().add_child(c)
	c.global_position = global_position
	c.fire(player.global_position)
