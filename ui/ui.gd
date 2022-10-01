extends Control


func _ready():
	Globulars.player_death.connect(func():
		var lc = $MarginContainer/LifeContainer
		if lc.get_child_count() > 0:
			lc.get_child(lc.get_child_count()-1).queue_free()
	)
