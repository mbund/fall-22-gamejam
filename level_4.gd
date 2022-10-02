extends Node2D

@onready
var player_scene = load("res://player/player.tscn")


func _ready():
	Globulars.world = self
	Globulars.current_level = "res://level_4.tscn"
	var player = player_scene.instantiate();
	player.global_position = $player_spawn.global_position
	get_viewport().get_camera_2d().global_position = player.global_position
	add_child(player)

func _process(_delta):
	if !has_node("EnemyShip2") and !has_node("EnemyShip3") and !has_node("EnemyShip6") and !has_node("EnemyShip14") and !has_node("EnemyShip15") and !has_node("EnemyShip16"):
		SceneTransition.change_scene("res://level_5.tscn")
		set_process(false)
