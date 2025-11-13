extends Label
@onready var player_state_machine: Node = $"../../PlayerStateMachine"

func _process(delta: float) -> void:
	text = player_state_machine.current_state.name
