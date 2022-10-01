extends CharacterBody2D

@export
var target: Marker2D;

var laser_scene = preload("res://enemy/laser.tscn");
var missile_scene = preload("res://enemy/missile.tscn");
var previous_missile_front = false;


@export
var speed: float = 100;

var health = 24;

func _process(_delta):
	if health <= 0:
		queue_free();


func _on_missile_timer_timeout():
	if target == null:
		return
	var missile: CharacterBody2D = missile_scene.instantiate();
	if previous_missile_front:
		missile.position = $FrontMissileLauncher.global_position;
		var target_vector = target.global_position - $FrontMissileLauncher.global_position;
		missile.rotation = target_vector.angle();
	else:
		missile.position = $BackMissileLauncher.global_position;
		var target_vector = target.global_position - $BackMissileLauncher.global_position;
		missile.rotation = target_vector.angle();	
	previous_missile_front = !previous_missile_front;
	
	missile.target = target;
	missile.scale = Vector2(0.4, 0.4);
	missile.speed = 380;
	add_sibling(missile);


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
