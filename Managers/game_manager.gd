extends Node

# ---

# HANDLES SCENE SWITCH

var currentScene = null
var last_ID: int = 0

func _ready():
	var root = get_tree().root
	currentScene = root.get_child(root.get_child_count() - 1)

func switch_Scene(res_path):
	call_deferred("_deferred_switch_scene", res_path)

func _deferred_switch_scene(res_path):
	currentScene.free()
	last_ID = 0
	var s = load(res_path)
	currentScene = s.instantiate()
	get_tree().root.add_child(currentScene)
	get_tree().current_scene = currentScene

# ---
