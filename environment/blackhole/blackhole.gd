class_name Blackhole
extends Sprite2D

const gravity_strength = 1000000

func _ready():
	Globulars.blackholes.append(self)
