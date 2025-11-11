extends Camera2D

@export var player: CharacterBody2D 

func _process(_delta: float) -> void:
	self.global_position.x = player.global_position.x
