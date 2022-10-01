extends CharacterBody2D

@export
var target: Marker2D;
@export
var firing_randomness: float;
@export
var firing_cone: float;
#@export_range(0, 1.0)
#var turning_speed: float;
@export
var speed: float;

# true when the last gun fired was the right gun
var previous_gun_right = false;

var laser_scene = preload("res://enemy/laser.tscn")
@onready
var left_gun: Marker2D = $LeftGun;
@onready
var right_gun: Marker2D = $RightGun;
@onready
var explosion_scene = load("res://explosion.tscn")
var health: int = 4;

func _physics_process(delta):
	if(target == null): 
		return;
	var marker_vector = target.global_position - global_position;
	var current_direction = Vector2(1, 0).rotated(rotation);
	rotation = marker_vector.angle();
	
	if(marker_vector.length() > speed):
		velocity = Vector2(speed, 0).rotated(self.rotation)
		move_and_collide(velocity * delta)
		$LeftEngine.visible = true;
		$RightEngine.visible = true;
		$CenterEngine.visible = true;
	else:
		$LeftEngine.visible = false;
		$RightEngine.visible = false;
		$CenterEngine.visible = false;

func pointing_at_player():
	if(target == null):
		return;
	var marker_vector = target.global_position - global_position;
	var current_direction = Vector2(1, 0).rotated(rotation);
	return marker_vector.angle_to(current_direction) < deg_to_rad(firing_cone);

func _on_timer_timeout():
	if(!pointing_at_player() || !$WaitTimer.is_stopped()):
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

func _process(_delta):
	if health <= 0:
		queue_free();
		var explosion = explosion_scene.instantiate();
		explosion.global_position = self.global_position;
		explosion.scale = Vector2(4, 4);
		add_sibling(explosion);
	if Globulars.player != null:
		target = Globulars.player.get_node("target")

