class_name Player
extends RigidBody2D

const acceleration_strength = 1000
const break_strength = acceleration_strength
const rotation_strength = PI
const blackhole_strength = 10000
const dec = 1

@onready var exhaust: CanvasItem = $exhaust
@onready var exhaustfront: CanvasItem = $exhaustfront

func _ready():
	Globulars.player = self

func _process(delta):
	if Input.is_action_pressed("accelerate"):
		add_constant_force(acceleration_strength  * transform.x * delta)
		exhaust.visible = true
	else:
		exhaust.visible = false
	if Input.is_action_pressed("brake"):
		add_constant_force(-break_strength  * transform.x * delta)
		exhaustfront.visible = true
	else:
		exhaustfront.visible = false
	if Input.is_action_pressed("left"):
		angular_velocity = -rotation_strength
	elif Input.is_action_pressed("right"):
		angular_velocity = rotation_strength
	else:
		angular_velocity = 0
