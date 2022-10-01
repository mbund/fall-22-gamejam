extends CharacterBody2D


var laser_scene = preload("res://enemy/laser.tscn");
@export var turning_speed = 0.25;

@export var target: Marker2D;

@onready
var explosion_scene = load("res://explosion.tscn")

var health = 10;

func _on_gun_timer_timeout():
	for node in $GunPositions.get_children():
		var laser_direction = (node.global_position - $GunPositions.global_position).angle();
		var laser: CharacterBody2D = laser_scene.instantiate();
		laser.rotation = laser_direction;
		laser.global_position = node.global_position;
		add_sibling(laser);
		

func _physics_process(delta):
	rotation += delta * turning_speed;

func _process(_delta):
	if health <= 0:
		queue_free();
		var explosion = explosion_scene.instantiate();
		explosion.global_position = self.global_position;
		explosion.scale = Vector2(5, 5);
		add_sibling(explosion);



func _on_teleport_timer_timeout():
	if target == null:
		return
	global_position = Vector2(1, 0).rotated(target.rotation + PI + randf_range(-0.1, 0.1)) * randf_range(200, 400) + target.global_position
