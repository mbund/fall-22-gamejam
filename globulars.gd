extends Node

@onready var PlayerScene = load("res://player/player.tscn")
@onready var LossScene = load("res://LossScreen.tscn")

var player: Player
var world: Node
var blackholes: Array[Blackhole]
var ui: Node


func calculate_gravity(pos: Vector2, stop_at_blackhole=false) -> Vector2:
	var gravity = Vector2.ZERO
	for blackhole in blackholes:
		var r = (blackhole.global_position - pos)
		gravity += blackhole.gravity_strength * (r.normalized() / r.length_squared())
	return gravity


func on_player_death():
	if ui != null:
		var player_container = ui.get_node("LifeContainer")
		if player_container.get_child_count() == 0:
			pass
			get_tree().change_scene_to_packed(LossScene);
			return
		player_container.get_child(player_container.get_child_count() - 1).queue_free()

	await get_tree().create_timer(1.0).timeout
	player = PlayerScene.instantiate()
	world.add_child(player)
	
	
