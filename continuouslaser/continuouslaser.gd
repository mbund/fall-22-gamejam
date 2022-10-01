class_name ContinuousLaser
extends Node2D

@onready var line2d: Line2D = $Line2d

@export var start_pos: Vector2 = Vector2(0, 0)
@export var facing: Vector2 = Vector2(1, 0)

func _ready():
	for i in range(100):
		line2d.add_point(Vector2(0, 0))
		
func _process(delta):
	var curr = start_pos
	var velocity = facing * 10
	for i in range(100):
		line2d.set_point_position(i, curr)
		velocity += Globulars.calculate_gravity(curr)
		curr += velocity
		
