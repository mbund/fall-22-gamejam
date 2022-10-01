class_name Player
extends RigidBody2D

const acceleration_strength = 1000
const break_strength = acceleration_strength
const rotation_strength = PI
const blackhole_strength = 50
const dec = 1

@onready var exhaust: CanvasItem = $exhaust
@onready var exhaustfront: CanvasItem = $exhaustfront

func _ready():
	Globulars.player = self

func _integrate_forces(state):
	if Input.is_action_pressed("accelerate"):
		constant_force = acceleration_strength * transform.x
	elif Input.is_action_pressed("brake"):
		constant_force = -break_strength  * transform.x
	else:
		constant_force = Vector2.ZERO
	
	exhaust.visible = Input.is_action_pressed("accelerate")
	exhaustfront.visible = Input.is_action_pressed("brake")
	
	if Input.is_action_pressed("left"):
		angular_velocity = -rotation_strength
	elif Input.is_action_pressed("right"):
		angular_velocity = rotation_strength
	else:
		angular_velocity = 0
