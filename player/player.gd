class_name Player
extends CharacterBody2D

const acceleration_strength = 1000
const break_strength = acceleration_strength
const rotation_strength = PI
const dec = 1

@onready var exhaust: CanvasItem = $exhaust
@onready var exhaustfront: CanvasItem = $exhaustfront
var continuouslaser: ContinuousLaser
@onready var laser_scene = load("res://player/PlayerLaser.tscn")
@onready var explosion_scene = load("res://explosion.tscn")

var health = 1;


func _ready():
	Globulars.player = self
	
func _process(delta):
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
	if Input.is_action_pressed("fire") && $GunCooldown.is_stopped():
		var laser: CharacterBody2D = laser_scene.instantiate();
		laser.rotation = rotation;
		laser.global_position = $LeftGun.global_position;
		add_sibling(laser);
		
		var laser2: CharacterBody2D = laser_scene.instantiate();
		laser2.rotation = rotation;
		laser2.global_position = $RightGun.global_position;
		add_sibling(laser2);
		$GunCooldown.start();

	if(health <= 0):
		die()
	
	move_and_slide()



	
func die():
	var explosion = explosion_scene.instantiate();
	explosion.global_position = self.global_position;
	explosion.scale = Vector2(9, 9);
	add_sibling(explosion);
	Globulars.player = null
	queue_free()
	Globulars.on_player_death()
