extends CharacterBody2D

@export
var speed = 1500

var grace_period = true

func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(self.rotation)
	if move_and_collide(velocity * delta) != null && !grace_period:
		queue_free()


func _on_timer_timeout():
	queue_free()


func _on_grace_period_timer_timeout():
	grace_period = false
