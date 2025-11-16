extends Node
class_name MovementComponent

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")

@export_enum("move_left", "follow_player", "move_between_points", "still") var state: int
@export var enemy: CharacterBody2D
@export var hitRay: RayCast2D
@export var downRay: RayCast2D
@export var pivot: Node2D
@export var speed: int = 100
@export var chase_distance: float = 100

@export var anim_sprite: AnimatedSprite2D

var lastPos: Vector2 = Vector2.ZERO
var dir: Vector2 = Vector2.LEFT

func _process(delta: float) -> void:
	if anim_sprite != null:
		animate()
	
	match state:
		0:
			move_left(delta)
		1:
			follow_player(delta)
		3:
			still_nShoot(delta)
			

func still_nShoot(delta):
	var playerDir = snapped((player.global_position - enemy.global_position).normalized().x, 1)
	if playerDir == 0:
		return
	
	dir.x = playerDir
	pivot.scale = Vector2(-playerDir, 1)

func follow_player(delta):
	if (player.global_position - enemy.global_position).length() < chase_distance:
		var playerDir = snapped((player.global_position - enemy.global_position).normalized().x, 1)
		if playerDir == 0:
			return
		
		dir.x = playerDir
		pivot.scale = Vector2(-playerDir, 1)
		
		enemy.velocity.x = playerDir * speed * delta
	else:
		if hitRay.is_colliding() or !downRay.is_colliding():
			dir = -dir
			pivot.scale = Vector2(-pivot.scale.x, 1)
			
		
		enemy.velocity.x = dir.x * speed * delta

func move_left(delta: float):
	if hitRay.is_colliding() or !downRay.is_colliding():
		dir = -dir
		pivot.scale = Vector2(-pivot.scale.x, 1)
	
	enemy.velocity.x = dir.x * speed * delta

func animate():
	if state == 3:
		return
	elif 1 < abs(enemy.velocity.x):
		anim_sprite.play("walk")
	else:
		anim_sprite.pause()
