extends Node2D
@export_multiline var next_scene_path: String
@export var RoomSizeCollider: CollisionShape2D
@export var KillArea: Area2D
@onready var roomRect: Rect2 = RoomSizeCollider.shape.get_rect()
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")

var state: Callable = handle_idle
var blastsSpawned: int = 0

func _physics_process(delta) -> void:
	print(state)
	print(KillArea.get_overlapping_bodies())
	print(player)
	
	if PlayerStatsManager.get_stat("pukecandies") >= 10 and state == handle_idle and KillArea.get_overlapping_bodies().has(player):
		switch_state(handle_death)
	
	
	match state:
		handle_idle:
				state.call()
		handle_blast: 
				state.call()
		handle_death:
				state.call()

func switch_state(new_state: Callable):
	state = new_state

func handle_idle():
	pass
	 # play idle animation 
	 # small grace period for player
	# If all candies, kill boss here.

func handle_blast(): 
	pass
	 # Get room rect and create blasts/areas of damage randomly based on that.
	# Create a function that takes a vector ie direction. and a position for blast

func handle_death():
	print("switch")
	GameManager.switch_Scene(next_scene_path)

func handle_spawn():
	pass
	# Handle spawning candies/enemies.
