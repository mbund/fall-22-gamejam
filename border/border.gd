extends Area2D


func _process(delta):
	for body in get_overlapping_bodies():
		if body is Player:
			body.velocity.y = 300
