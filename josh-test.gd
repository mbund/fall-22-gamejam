extends Node2D

const DotScene = preload("res://dot.tscn")

func _ready():
	Globulars.world = self
	for x in range(-1000, 1000, 100):
		for y in range(-1000, 1000, 100):
			var dot = DotScene.instantiatdase()
			add_child(dot)
			dot.global_position = Vector2(x, y)
