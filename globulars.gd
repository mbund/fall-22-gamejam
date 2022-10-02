extends Node

@onready var PlayerScene = load("res://player/player.tscn")

var player: Player
var world: Node
var camera
var blackholes: Array[Blackhole]
var lives: int
var player_spawn_timer = null
var laser_sound_allowed = true

signal player_death

func calculate_gravity(pos: Vector2, stop_at_blackhole=false) -> Vector2:
	var gravity = Vector2.ZERO
	for blackhole in blackholes:
		var r = (blackhole.global_position - pos)
		gravity += blackhole.gravity_strength * (r.normalized() / r.length_squared())
	return gravity

func reset():
	lives = 3

func _ready():
	reset()
	player_death.connect(func():
		if lives == 0:
			SceneTransition.change_scene("res://LossScreen.tscn")
			return
		lives -= 1
		var old_world = world
		await get_tree().create_timer(1.0).timeout
		if world == old_world and world.get_node("player_spawn") != null:
			player = PlayerScene.instantiate()
			player.global_position = world.get_node("player_spawn").global_position
		world.add_child(player)
	)
