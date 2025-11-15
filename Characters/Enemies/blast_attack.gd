extends Area2D

## Instead of getting all players in area and dealing damage to them, the player gets all enemies in touch with them.
# This is stupid.
@export var damage_amount: int = 1
@onready var blast_timer: Timer = $BlastTimer

func blast(timeBetweenBlasts: float):
	monitorable = true
	blast_timer.start(timeBetweenBlasts)

func _on_blast_timer_timeout() -> void:
	queue_free()
