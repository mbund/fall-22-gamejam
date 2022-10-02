extends Node2D


func _process(delta):
	if body is Player:
		body.global_position.y = global_position.y - 10
		body.velocity.y = 300
