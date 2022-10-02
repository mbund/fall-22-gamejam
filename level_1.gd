extends Node2D

@onready
var player_scene = load("res://player/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Globulars.world = self
	var player = player_scene.instantiate();
	player.global_position = $player_spawn.global_position;
	add_child(player)
