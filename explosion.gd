extends AnimatedSprite2D

func _ready():
	Globulars.camera.shake(3000, 0.1 , 3000) 

func _on_animated_sprite_2d_animation_finished():
	queue_free()
