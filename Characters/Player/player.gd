extends CharacterBody2D

@export var speed = 1200
@export var jump_speed = 1500
@export var gravity = 4000
@export var damage: int = 1
@export_range(0.0, 1.0) var friction = 0.1
@export_range(0.0 , 1.0) var acceleration = 0.25
@export var dash_speed = 2500
@export var maxDashTime: float = 0.2
@export_range(0.0 , 1.0) var cameraZoom = 1.0


@onready var camera_min_y: Node2D = get_tree().get_first_node_in_group("CameraMinY")
@onready var camera_max_x: Node2D = get_tree().get_first_node_in_group("CameraMaxX")
@onready var camera_2d: Camera2D = $Camera2D
@onready var pivot: Node2D = $Pivot
@onready var player_state_machine: Node = $PlayerStateMachine
@onready var hurt_state: Node = $PlayerStateMachine/HurtState
@onready var hit_box: Area2D = $HitBox
@onready var animated_sprite_2d: AnimatedSprite2D = $Pivot/AnimatedSprite2D

func _ready() -> void:
	camera_2d.zoom = Vector2(cameraZoom, cameraZoom)
	if camera_max_x != null:
		camera_2d.limit_top = camera_min_y.global_position.y
		camera_2d.limit_right = camera_max_x.global_position.x

# This is a dumb implementation of damage. We scan for all enemies in an area and deal damage if they appear.
func hitbox():
	if !hurt_state.invulnerable:
		var e = hit_box.get_overlapping_bodies()
		if !e.is_empty():
			deal_damage_to_player(e.front(), e.front().damage_amount)
		
		var A = hit_box.get_overlapping_areas()
		if !A.is_empty():
			deal_damage_to_player(A.front(), A.front().damage_amount)
		

func deal_damage_to_player(by: Node, amount: int):
	print("player rec hurt")
	
	
	
	hurt_state.base(by, amount)
	player_state_machine.switch_state(hurt_state)

func get_vel(delta: float):
	var dir = Input.get_axis("left", "right")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction)

func _physics_process(delta: float) -> void:
	get_vel(delta)

func _process(delta: float) -> void:
	hitbox()
	
	velocity.y += gravity * delta
	
	move_and_slide()
	
	if velocity.x > 0:
		pivot.scale = Vector2(1,1)
	elif velocity.x < 0:
		pivot.scale = Vector2(-1,1)
