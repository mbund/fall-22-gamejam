extends Node

@export var num_black_holes = 4;

var blackhole_scene = preload("res://environment/blackhole/blackhole.tscn");

const MEASURE = 500;

func _ready():
	for _i in range(num_black_holes):
		var x = randf_range(0, MEASURE)
		var y = randf_range(0, MEASURE)
		
		var blackhole: Sprite2D = blackhole_scene.instantiate()
		blackhole.global_position = Vector2(x, y)
		
		add_child(blackhole)
	
	pass

func _process(delta):
	pass
