class_name Blackhole
extends Sprite2D

@export var gravity_strength = 3000000

func _ready():
	Globulars.blackholes.append(self)


func _on_area_2d_body_entered(body):
	if body is Player:
		$PlayerDeathSound.play()
		body.die()
