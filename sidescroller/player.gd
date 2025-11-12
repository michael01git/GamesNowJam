extends CharacterBody2D

@export var speed = 1200
@export var jump_speed = 1500
@export var gravity = 4000
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25

@onready var pivot: Node2D = $Pivot

func _process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if velocity.x > 0:
		pivot.scale = Vector2(1,1)
	elif velocity.x < 0:
		pivot.scale = Vector2(-1,1)
