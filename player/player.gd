class_name Player
extends CharacterBody2D

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
		velocity += acceleration_strength  * transform.x * delta
		exhaust.visible = true
	else:
		exhaust.visible = false
	if Input.is_action_pressed("brake"):
		velocity -= break_strength  * transform.x * delta
		exhaustfront.visible = true
	else:
		exhaustfront.visible = false
	if Input.is_action_pressed("left"):
		rotate(-rotation_strength * delta)
	if Input.is_action_pressed("right"):
		rotate(rotation_strength * delta)
		
	move_and_slide()
	
func black_hole_gravity(bh_position: Vector2):
	var r = bh_position - global_position
	var dist = r.length()
	velocity += blackhole_strength * (r/dist) / (r.length()**2)
