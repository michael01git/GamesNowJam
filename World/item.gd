extends Area2D

@export var itemType: String
@export var itemAmount: int

func _on_body_entered(body: Node2D) -> void:
	PlayerStatsManager.add_to_stat(itemType, itemAmount)
	queue_free()
