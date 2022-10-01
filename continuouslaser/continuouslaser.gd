class_name ContinuousLaser
extends Node2D

@onready var line2d: Line2D = $Line2d

const numpoints = 25

func _ready():
	for i in range(numpoints):
		line2d.add_point(Vector2(0, 0))
		
func _process(_delta):
	var curr = Vector2.ZERO
	var velocity = Vector2.RIGHT * 10
	var factor = 12
	for i in range(numpoints):
		line2d.set_point_position(i, curr)
		velocity += 0.1 * Globulars.calculate_gravity(to_global(curr))
		for bh in Globulars.blackholes:
			if to_global(curr).distance_squared_to(bh.global_position) < 200*200:
				factor = 0.4
			if to_global(curr).distance_squared_to(bh.global_position) < 100*100:
				factor = 0
#		if i > 5 and curr.distance_squared_to(start_pos) < 30*30:
#			print("damage")
		curr += factor*velocity
		
