extends CharacterBody2D

@export
var target: Marker2D;
@export
var firing_randomness: float;
@export
var firing_cone: float;
@export_range(0, 1.0)
var turning_speed: float;
@export
var speed: float;

# true when the last gun fired was the right gun
var previous_gun_right = false;

var laser_scene = preload("res://enemy/laser.tscn")
@onready
var left_gun: Marker2D = $LeftGun;
@onready
var right_gun: Marker2D = $RightGun;

var health = 8;

func _process(_delta):
	if health <= 0:
		queue_free();


func _physics_process(delta):
	if(target == null): 
		return;
	var marker_vector = target.global_position - global_position;
	var current_direction = Vector2(1, 0).rotated(rotation);
	#print("marker: ", rad_to_deg(marker_vector.angle()));
	#print("current: ", rad_to_deg(current_direction.angle()));
	rotation = marker_vector.angle();
	#rotation = lerp(rotation, marker_vector.angle(), turning_speed)
	
	if(marker_vector.length() > speed):
		velocity = Vector2(speed, 0).rotated(self.rotation)
		move_and_slide()
		$LeftEngine.visible = true;
		$RightEngine.visible = true;
	else:
		$LeftEngine.visible = false;
		$RightEngine.visible = false;

func pointing_at_player():
	if(target == null):
		return;
	var marker_vector = target.global_position - global_position;
	var current_direction = Vector2(1, 0).rotated(rotation);
	return marker_vector.angle_to(current_direction) < deg_to_rad(firing_cone);


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
	laser.rotation = (rotation) + randf_range(-firing_randomness, firing_randomness);
	add_sibling(laser);
