extends Node

var player: Player
var blackholes: Array[Blackhole]

func calculate_gravity(pos: Vector2) -> Vector2:
	var gravity = Vector2.ZERO
	for blackhole in blackholes:
		var r = (blackhole.global_position - pos)
		gravity += blackhole.gravity_strength * (r.normalized() / r.length_squared())
	return gravity
