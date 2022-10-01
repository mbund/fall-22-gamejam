extends CharacterBody2D

@export
var speed: float = 3000;

func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(self.rotation)
	# very janky solution to make black holes destroy lasers
	if Globulars.calculate_gravity(global_position).length() > 90:
		queue_free()
	velocity += Globulars.calculate_gravity(global_position) / (2.0 * delta)
	self.rotation = velocity.angle()
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision != null:
		if collision.get_collider().get("health") != null:
			collision.get_collider().set("health", collision.get_collider().get("health") - 1)
		queue_free()

func _on_lifespan_timer_timeout():
	queue_free()
