extends CharacterBody2D

@export
var speed = 1500

func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(self.rotation)
	move_and_collide(velocity * delta)


func _on_timer_timeout():
	queue_free()
