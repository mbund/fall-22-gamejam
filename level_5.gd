extends Node2D

@onready
var player_scene = load("res://player/player.tscn")

@onready var timer: Timer = $Timer
@onready var label: Label = $CanvasLayer2/VBoxContainer/MarginContainer/Label

func _ready():
	get_viewport().get_camera_2d().zoom = Vector2(0.25, 0.25)
	Globulars.camera.lock_position = Vector2(0,0)
	Globulars.world = self
	var player = player_scene.instantiate();
	player.global_position = $player_spawn.global_position
	get_viewport().get_camera_2d().global_position = player.global_position
	add_child(player)
	timer.start()
	timer.timeout.connect(func():
		SceneTransition.change_scene("res://WinScreen.tscn")
	)
	Globulars.player_death.connect(func():
		timer.start()
	)

func _process(delta):
	label.text = "Survive %d seconds" % timer.time_left
