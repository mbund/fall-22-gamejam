extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var time: float = 0;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta;
	self.global_position = Vector2(1, 0).rotated(time) * 400;
