extends CharacterBody2D

@export 
var target: Marker2D;
@export
var speed: float = 250;

@onready
var explosion_scene = load("res://explosion.tscn")

func _physics_process(delta):
	if target == null:
		queue_free()
		return;
	var target_vector = target.global_position - global_position;
	var target_angle = target_vector.angle();
	rotation = lerp_angle(rotation, target_angle, 0.2);
	var collision = move_and_collide(Vector2(speed, 0).rotated(rotation) * delta);
	if collision != null:
		print("collision")
		if collision.get_collider().get("health") != null:
			print("damage")
			collision.get_collider().set("health", collision.get_collider().get("health") - 1)
		queue_free()


func _on_detonation_timer_timeout():
	var explosion = explosion_scene.instantiate();
	explosion.global_position = self.global_position;
	explosion.scale = Vector2(4, 4);
	add_sibling(explosion);
	queue_free()
