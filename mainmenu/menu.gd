extends Node2D


func _on_start_button_pressed():
	SceneTransition.change_scene(Globulars.current_level)
