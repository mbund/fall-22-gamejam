extends Node

@onready var PlayerScene = load("res://player/player.tscn")

var player: Player
var world: Node
var camera
var blackholes: Array[Blackhole]
var lives: int = 3

signal player_death

func calculate_gravity(pos: Vector2, stop_at_blackhole=false) -> Vector2:
	var gravity = Vector2.ZERO
	for blackhole in blackholes:
		var r = (blackhole.global_position - pos)
		gravity += blackhole.gravity_strength * (r.normalized() / r.length_squared())
	return gravity

func _ready():
	player_death.connect(func():
		if lives == 0:
			SceneTransition.change_scene("res://LossScreen.tscn")
			return
		lives -= 1
		await get_tree().create_timer(1.0).timeout
		if world.get_node("player_spawn") != null:
			player.global_position = world.get_node("player_spawn").global_position
		world.add_child(player)
	)
