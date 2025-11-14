extends Camera2D

@onready var static_body_2d: StaticBody2D = $StaticBody2D
@export var player: CharacterBody2D 
@export_range(0.0, 1.0) var follow_speed = 0.1
@export var follow_at_dist: float = 1000
@export_enum("followLeft", "followX", "followAll") var state: int = 0

var lastX: float = 0


func _ready() -> void:
	if state != 0:
		static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED

func _process(_delta: float) -> void:
	match state:
		0:
			followAndLock()
		1:
			justFollowX()
		2:
			followAll()

func get_player_distance():
	return (player.global_position - self.global_position).length()

func followAll():
	var playerPos = player.global_position
	#TODO Make follow after a distance is great enough.
	if get_player_distance() > follow_at_dist:
		self.global_position = lerp(self.global_position, playerPos, follow_speed)

func justFollowX():
	var playerPos = player.global_position.x
	#TODO Make follow after a distance is great enough.
	self.global_position.x = lerpf(self.global_position.x, playerPos, follow_speed)

func followAndLock():
	var playerPos = player.global_position.x
	
	if lastX < playerPos:
		self.global_position.x = lerpf(self.global_position.x, playerPos, follow_speed)
		lastX = playerPos
