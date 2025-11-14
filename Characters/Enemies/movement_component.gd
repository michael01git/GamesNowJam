extends Node
class_name MovementComponent

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")

@export_enum("move_left", "follow_player", "move_between_points") var state: int
@export var enemy: CharacterBody2D
@export var hitRay: RayCast2D
@export var downRay: RayCast2D
@export var pivot: Node2D
@export var speed: int = 100


var lastPos: Vector2 = Vector2.ZERO
var dir: Vector2 = Vector2.LEFT

func _process(delta: float) -> void:
	match state:
		0:
			move_left(delta)

func move_left(delta: float):
	if hitRay.is_colliding() or !downRay.is_colliding():
		dir = -dir
		pivot.scale = Vector2(-pivot.scale.x, 1)
	
	enemy.velocity.x = dir.x * speed * delta
	
