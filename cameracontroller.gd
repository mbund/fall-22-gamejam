extends Camera2D

var shake_amount = 0
var default_offset = offset
# var tween: Tween
var shaking = false
var lock_position = null

func _ready():
	Globulars.camera = self



func _physics_process(delta):
	if lock_position != null:
		global_position = lock_position
	elif Globulars.get("player") != null:
		global_position += (Globulars.player.global_position - global_position) / 8

	if shaking:
		offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount)) * delta + default_offset

func shake(new_shake, shake_time=0.4, shake_limit=100):
	shake_amount += new_shake
	if shake_amount > shake_limit:
		shake_amount = shake_limit

	shaking = true
	await get_tree().create_timer(shake_time).timeout
	shake_amount = 0
	shaking = false

	var tween = get_tree().create_tween().bind_node(self)
	var t = tween.tween_property(self, "offset", default_offset, 0.1)
	t.set_trans(Tween.TRANS_QUAD)
	t.set_ease(Tween.EASE_IN_OUT)
	# tween.interpolate_property(self, "offset", offset, default_offset, 0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
