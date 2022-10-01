class_name Player
extends CharacterBody2D

const acceleration_strength = 1000
const break_strength = acceleration_strength
const rotation_strength = PI
const dec = 1

@onready var exhaust: CanvasItem = $exhaust
@onready var exhaustfront: CanvasItem = $exhaustfront
var continuouslaser: ContinuousLaser

func _ready():
	Globulars.player = self
	
func _process(delta):
	continuouslaser = Globulars.world.get_node("continuouslaser")
	
	velocity += Globulars.calculate_gravity(global_position)
	
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
		
	if continuouslaser:
		continuouslaser.start_pos = $Marker2d.global_position
		continuouslaser.facing = transform.x
		
	move_and_slide()
	
func die():
	Globulars.player = null
	queue_free()
	Globulars.on_player_death()
