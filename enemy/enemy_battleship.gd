extends CharacterBody2D

@export
var target: Marker2D;

var laser_scene = preload("res://enemy/laser.tscn");

@export
var speed: float = 100;

func _on_missile_timer_timeout():
	pass # Replace with function body.


func _on_laser_timer_timeout():
	if target == null:
		return
	var laser: CharacterBody2D = laser_scene.instantiate();
	laser.position = $FrontLaserCannon.global_position;
	var target_vector = target.global_position - $FrontLaserCannon.global_position;
	laser.rotation = target_vector.angle();
	add_sibling(laser);
	var laser2: CharacterBody2D = laser_scene.instantiate();
	laser2.position = $BackLaserCannon.global_position;
	var target_vector2 = target.global_position - $BackLaserCannon.global_position;
	laser2.rotation = target_vector2.angle();
	add_sibling(laser2);

func _physics_process(delta):
	if target == null:
		return
	var target_vector = target.global_position - global_position;
	rotation = target_vector.angle() - PI / 2
	move_and_collide(Vector2(speed, 0).rotated(rotation) * delta);
