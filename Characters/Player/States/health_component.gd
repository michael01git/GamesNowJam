extends Node
class_name HealthComponent

@onready var this: Node = get_parent()

@export var healthAmount: int = 1
@export var scoreToAdd: int = 100

signal death(attacker)

func _ready() -> void:
	add_to_group("HealthComponent")

## When healthcomponent receives damage by what entity and what amount.
func dealt_damage(by: Node, amount: int):
	healthAmount -= amount
	print("ouch")
	if healthAmount <= 0:
		die(by)

func die(by: Node):
	print("die")
	PlayerStatsManager.add_to_stat("score", scoreToAdd)
	
	emit_signal("death", by)
