extends AnimatedSprite2D

var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	if time > 10000:
		time = 0
	
	self.material.set_shader_parameter('bulge',sin(time*2)* 0.25)
