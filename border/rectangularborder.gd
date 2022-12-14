extends Node2D

@onready var BordrScene: PackedScene = load("res://border/border.tscn")

@export var size: Vector2
@export var topleft: Vector2

func _ready():
	var rect = Rect2(topleft, size)
	var top = BordrScene.instantiate()
	top.position = Vector2(0, -size.y/2)+rect.get_center()
	top.scale.x = size.x/1000
	top.setvelocity = Vector2(0, 300)
	add_child(top)
	
	var left = BordrScene.instantiate()
	left.position = Vector2(-size.x/2, 0)+rect.get_center()
	left.scale.x = size.y/1000
	left.setvelocity = Vector2(300, 0)
	left.rotation = -PI/2
	add_child(left)
	
	var bottom = BordrScene.instantiate()
	bottom.position = Vector2(0, size.y/2)+rect.get_center()
	bottom.scale.x = size.x/1000
	bottom.setvelocity = Vector2(0, -300)
	bottom.rotation = PI
	add_child(bottom)
	
	var right = BordrScene.instantiate()
	right.position = Vector2(size.x/2, 0)+rect.get_center()
	right.scale.x = size.y/1000
	right.setvelocity = Vector2(-300, 0)
	right.rotation = PI/2
	add_child(right)
