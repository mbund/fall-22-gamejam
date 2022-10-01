extends Camera2D


func _process(delta):
	if Globulars.player:
		global_position += (Globulars.player.global_position - global_position) / 8
