extends Node2D

@export_subgroup("Level Items")
@export_multiline var next_scene_path: String
@export var KillArea: Area2D
@export var enemySpawnPoints: Array[Node2D]
@export var enemyScene: PackedScene
@export var blastScene: PackedScene

@export_subgroup("Variables")
@export var attackRadious: float = 100
@export var timeBetweenBlasts: float = 3
@export var idleTime: float = 3
@export var blastCooldown: int = 3
@export var candies_to_kill: int = 3
@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var blast_timer: Timer = $BlastTimer



var state: Callable = handle_idle
var blastsSpawned: int = 0
var blasting: bool = false

func _physics_process(delta) -> void:
	print(state)
	
	if PlayerStatsManager.get_stat("pukecandies") >= candies_to_kill and state == handle_idle and KillArea.get_overlapping_bodies().has(player):
		switch_state(handle_death)
	
	
	match state:
		handle_idle:
				state.call()
		handle_blast: 
				state.call()
		handle_spawn:
				state.call()
		handle_death:
				state.call()

## + Await
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func switch_state(new_state: Callable):
	state = new_state

func handle_idle():
	await wait(idleTime)
	switch_state(handle_blast)



func handle_blast(): 
	create_blast()

func create_blast():
	if !blasting:
		print("blasting")
		blasting = true
		
		var b = blastScene.instantiate()
		add_child(b)
		b.global_position = get_random_pos()
		
		b.look_at(global_position)
		b.blast(timeBetweenBlasts)
		blast_timer.start(timeBetweenBlasts)
		
		blastsSpawned += 1
		
		if blastsSpawned >= blastCooldown:
			blastsSpawned = 0
			switch_state(handle_spawn)

func _on_blast_timer_timeout() -> void:
	blasting = false

func get_random_pos() -> Vector2:
	var randomDir = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	return global_position + (randomDir * attackRadious)

func handle_death():
	print("switch")
	GameManager.switch_Scene(next_scene_path)

func handle_spawn():
	
	##if enemySpawnPoints != null:
	##	for i in enemySpawnPoints:
	##		var c = enemyScene.instantiate()
 	##		i.add_child(c)
	##		c.global_position = i.global_position
	
	switch_state(handle_idle)
