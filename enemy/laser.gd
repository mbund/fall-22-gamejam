extends CharacterBody2D

@export
var speed: float = 2500;

func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(self.rotation)
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision != null:
		if collision.get_collider().get("health") != null:
			print("hit enemy")
			collision.get_collider().set("health", collision.get_collider().get("health") - 1)
		queue_free()

func _on_lifespan_timer_timeout():
	queue_free()
