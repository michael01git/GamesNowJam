extends Camera2D

@export var player: CharacterBody2D 
@export_range(0.0, 1.0) var follow_speed = 0.1
@export var follow_offset: float = 100

var lastX: float = 0


func _process(_delta: float) -> void:
	var playerPos = player.global_position.x - follow_offset
	
	if lastX < playerPos:
		self.global_position.x = lerpf(self.global_position.x, playerPos, follow_speed)
		lastX = playerPos
