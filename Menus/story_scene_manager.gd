extends Control

@export var picArray: Array[CompressedTexture2D]
@export_multiline var textArray: Array[String]
@export var picNode: TextureRect
@export var textNode: Label
@export var nextButton: Button
@export var sceneChangerNode: Control

signal lastShown

var current_slide: int = 1

func _ready() -> void:
	self.connect("lastShown", switchScene)
	nextButton.connect("pressed", button_pressed)
	
	if textArray.is_empty():
		emit_signal("lastShown")
		return
	
	picNode.texture = picArray.get(0)
	textNode.text = textArray.get(0)

func switchScene():
	sceneChangerNode.change_scene()

func button_pressed():
	emit_signal("lastShown")
	return

func unused():
	if textArray.size() == current_slide:
		emit_signal("lastShown")
	else:
		
		current_slide += 1
		picNode.texture = picArray.get(current_slide)
		textNode.text = textArray.get(current_slide)
