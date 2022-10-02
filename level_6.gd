extends Node2D

@onready
var player_scene = load("res://player/player.tscn")

@onready 
var ship13_scene = load("res://enemy/enemy_ship_13.tscn")

@onready 
var ship12_scene = load("res://enemy/enemy_ship_12.tscn")

var e3_name;
var e4_name;
var e5_name;
var e6_name;


func _ready():
	Globulars.world = self
	var player = player_scene.instantiate();
	player.global_position = $player_spawn.global_position
	get_viewport().get_camera_2d().global_position = player.global_position
	add_child(player)
	#print(Globulars.player)
var wave_2_sent = false;
func send_wave_2():
	wave_2_sent = true;
	#await get_tree().create_timer(4.0).timeout
	var s = ship13_scene.instantiate();
	s.global_position = $e3_spawn.global_position;
	s.speed = 400;
	add_sibling(s)
	e3_name = s.get_path();
		
	var s1 = ship13_scene.instantiate();
	s1.global_position = $e4_spawn.global_position;
	s1.speed = 400;
	e4_name = s1.get_path()

var wave_3_sent = false;
func send_wave_3():
	wave_3_sent = true;
	#await get_tree().create_timer(4.0).timeout
	var s = ship13_scene.instantiate();
	s.global_position = $e5_spawn.global_position;
	s.speed = 300;
	add_sibling(s)
	e5_name = s.get_path();
		
	var s1 = ship12_scene.instantiate();
	s1.global_position = $e6_spawn.global_position;
	s1.speed = 300;
	add_sibling(s1)
	e6_name = s1.get_path();


func _process(delta):
	if !has_node("e1") && !has_node("e2"):
		if !wave_2_sent:
			print("sending wave 2")
			send_wave_2();
		elif !has_node(e3_name) && !has_node(e4_name):
			if !wave_3_sent:
				send_wave_3();
			elif !has_node(e5_name) && !has_node(e6_name):
				SceneTransition.change_scene("level_7.tscn")
