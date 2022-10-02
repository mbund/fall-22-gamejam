extends AnimationPlayer

@export_enum("pulse-in", "pulse-out") var animation: int

func _ready():
	set_autoplay(["pulse-in", "pulse-out"][animation])
