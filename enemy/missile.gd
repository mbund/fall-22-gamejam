extends CharacterBody2D

@export 
var target: Marker2D;
@export
var speed: float = 200;

func _physics_process(delta):
	if target == null:
		return;
	var target_vector = target.global_position - global_position;
	var target_angle = target_vector.angle();
	rotation = lerp_angle(rotation, target_angle, 0.2);
	move_and_collide(Vector2(speed, 0).rotated(rotation) * delta);
