extends Node2D


func _ready():
	Globulars.reset()
	await get_tree().create_timer(3.0).timeout
	SceneTransition.change_scene("res://mainmenu/menu.tscn")
