extends State
class_name AirState

@onready var idle_state: IdleState = $"../IdleState"
@onready var move_state: MoveState = $"../MoveState"
@onready var attack_state: AttackState = $"../AttackState"
@onready var pivot: Node2D = $"../../Pivot"

var dashed: bool = false
var dashedTime: float = 0

func on_enter():
	dashed = false

func state_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		next_state = attack_state
	elif event.is_action_pressed("dash"):
		dash()

func dash():
	if !dashed:
		dashed = true
		dashedTime = 0
		print(pivot.scale.x)
		
		#player.velocity.x = pivot.scale.x * player.dash_speed


func state_process(delta: float) -> void:
	if dashed and (dashedTime <= player.maxDashTime):
		dashedTime += delta
		player.velocity.x = pivot.scale.x * player.dash_speed
	
	if player.is_on_floor():
		if player.velocity == Vector2.ZERO:
			next_state = idle_state
		else:
			next_state = move_state
	
