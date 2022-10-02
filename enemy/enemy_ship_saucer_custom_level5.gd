extends "res://enemy/enemy_ship_saucer.gd"

func _process(delta):
	health = 10000

func _on_teleport_timer_timeout():
	global_position.x = [1250, -1250][randi() % 2]
	global_position.y = [1250, -1250][randi() % 2]
