extends "res://enemy/enemy_ship_saucer.gd"

func _process(delta):
	health = 10000

func _on_teleport_timer_timeout():
	global_position.x = [1100, -1100][randi() % 2]
	global_position.y = [1100, -1100][randi() % 2]
