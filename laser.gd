extends CharacterBody2D

@export
var speed = 1000

func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(self.rotation)
	move_and_slide()


func _on_timer_timeout():
	queue_free()
