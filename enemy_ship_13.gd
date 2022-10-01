extends CharacterBody2D

@export
var target: Marker2D;

@export
var firing_randomness: float;

# true when the last gun fired was the right gun
var previous_gun_right = false;

var laser_scene = preload("res://laser.tscn")

@onready
var left_gun: Marker2D = $LeftGun;

@onready
var right_gun: Marker2D = $RightGun;

func _physics_process(delta):
	pass

func pointing_at_player():
	return true;


func _on_timer_timeout():
	if(!pointing_at_player()):
		return
	var laser: CharacterBody2D = laser_scene.instantiate();
	if(previous_gun_right):
		laser.position = left_gun.global_position;
		previous_gun_right = false;
	else:
		laser.position = right_gun.global_position;
		previous_gun_right = true;
	laser.rotation = (rotation - PI / 2) + randf_range(-firing_randomness, firing_randomness);
	add_sibling(laser);
