extends Camera2D

@onready var static_body_2d: StaticBody2D = $StaticBody2D
@export var player: CharacterBody2D 
@export_range(0.0, 1.0) var follow_speed = 0.1
@export var follow_offset: float = 100
@export var lockFollow: bool = true

var lastX: float = 0


func _ready() -> void:
	if !lockFollow:
		static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED

func _process(_delta: float) -> void:
	if lockFollow:
		followAndLock()
	else:
		justFollow()

func justFollow():
	var playerPos = player.global_position.x - follow_offset
	#TODO Make follow after a distance is great enough.
	self.global_position.x = lerpf(self.global_position.x, playerPos, follow_speed)

func followAndLock():
	var playerPos = player.global_position.x - follow_offset
	
	if lastX < playerPos:
		self.global_position.x = lerpf(self.global_position.x, playerPos, follow_speed)
		lastX = playerPos
