extends CharacterBody2D

@export
var target: Marker2D;
@export
var firing_randomness: float;
@export
var firing_cone: float;
@export
var turning_speed: float;

# true when the last gun fired was the right gun
var previous_gun_right = false;



var laser_scene = preload("res://enemy/laser.tscn")

@onready
var left_gun: Marker2D = $LeftGun;

@onready
var right_gun: Marker2D = $RightGun;


func _physics_process(delta):
	#var marker_vector = target.global_position - global_position;
	#var marker_direction = atan2(marker_vector.x, marker_vector.y)
	#print(fmod(rotation - marker_direction, TAU))
	#rotation = fmod(rotation + angle_movement * delta * turning_speed, TAU);
	#rotation = fmod(rotation + (rotation - marker_direction) * delta * 0.1, TAU)
	pass

func pointing_at_player():
	var marker_direction = global_position - target.global_position;
	return abs(atan2(marker_direction.x, marker_direction.y) + rotation) < deg_to_rad(firing_cone);


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
