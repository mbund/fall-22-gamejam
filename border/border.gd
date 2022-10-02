extends Area2D

@export var setvelocity: Vector2

var time = 0.0

func _ready():
	$ColorRect.material.set_shader_parameter("scalex", scale.x)

func _process(delta):
	time += delta
	$ColorRect.material.set_shader_parameter("t", time)
	

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body is Player:
			if setvelocity.x != 0:
				body.velocity.x = setvelocity.x
			if setvelocity.y != 0:
				body.velocity.y = setvelocity.y
