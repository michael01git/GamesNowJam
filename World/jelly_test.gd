extends Sprite2D

var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	self.material.set_shader_parameter('bulge',sin(time))
