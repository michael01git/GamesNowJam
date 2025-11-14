extends Node2D
class_name DamageComponent

@onready var this: Node = get_parent()

@export var damageAmount: int = 1
@export var damageArea: Area2D

## When player in area.
func deal_damage(to: Node2D):
	to.deal_damage_to_player(this, damageAmount)


func _on_damage_area_body_entered(body: Node2D) -> void:
	deal_damage(body)
