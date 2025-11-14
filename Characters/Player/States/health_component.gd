extends Node
class_name HealthComponent

@onready var this: Node = get_parent()

@export var healthAmount: int = 1
@export var scoreToAdd: int = 100
@export var coolDownTime: float = 1


var time_left: float = 0
var invulnerable: bool = false

signal death(attacker)

func _ready() -> void:
	add_to_group("HealthComponent")

## When healthcomponent receives damage by what entity and what amount.
func dealt_damage(by: Node, amount: int):
	if invulnerable:
		return
	
	healthAmount -= amount
	print("ouch")
	if healthAmount <= 0:
		die(by)
	
	start_cooldown()

func _process(delta: float) -> void:
	if !invulnerable:
		return
	
	time_left -= delta
	if time_left <= 0:
		time_left = 0
		invulnerable = false

func die(by: Node):
	print("die")
	PlayerStatsManager.add_to_stat("score", scoreToAdd)
	
	emit_signal("death", by)

func start_cooldown():
	invulnerable = true
	time_left = coolDownTime
