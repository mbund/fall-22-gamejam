extends CharacterBody2D


func _physics_process(delta):
	velocity += Globulars.calculate_gravity(global_position)
	move_and_slide()
