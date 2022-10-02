extends Node2D

@onready
var player_scene = load("res://player/player.tscn")

var wave = 1

func _ready():
	get_viewport().get_camera_2d().zoom = Vector2(0.35, 0.35)
	Globulars.world = self
	Globulars.current_level = "res://level_7.tscn"
	var player = player_scene.instantiate();
	player.global_position = $player_spawn.global_position
	get_viewport().get_camera_2d().global_position = player.global_position
	add_child(player)

var last_battleship_pos = Vector2(0,0)

func _process(delta):
	if $Battleship.health >= 0:
		last_battleship_pos = $Battleship.global_position
	else:
		Globulars.player.set_process(false)
		for x in get_children():
			if x is preload("res://enemy/laser.gd") or x is preload("res://enemy/missile.gd"):
				x.queue_free()
			elif x is preload("res://enemy/enemy_ship_1.gd"):
				x.health = 0
		Globulars.camera.lock_position = last_battleship_pos
		set_process(false)
		await get_tree().create_timer(3).timeout
		SceneTransition.change_scene("res://WinScreen.tscn")
		
