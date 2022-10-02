extends CharacterBody2D

var laser_scene = preload("res://enemy/laser.tscn");

@export
var target: Marker2D;
@onready
var explosion_scene = load("res://explosion.tscn")
@export var speed = 100;

var health = 12;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globulars.player != null:
		target = Globulars.player.get_node("target")
	if target == null:
		return
	var target_vector = target.global_position - global_position;
	rotation = target_vector.angle()
	if health <= 0:
		queue_free();
		var explosion = explosion_scene.instantiate();
		explosion.global_position = self.global_position;
		explosion.scale = Vector2(6, 6);
		add_sibling(explosion);

	
	if(target_vector.length() > speed):
		velocity = Vector2(speed, 0).rotated(self.rotation)
		move_and_slide()



func _on_timer_timeout():
	if target == null:
		return
	for node in $GunPositions.get_children():
		var laser_direction = (target.global_position - node.global_position).angle() + randf_range(-0.4, 0.4);
		var laser: CharacterBody2D = laser_scene.instantiate();
		laser.rotation = laser_direction;
		laser.global_position = node.global_position;
		add_sibling(laser);
