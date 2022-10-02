extends TextureButton

var pulsing = true;
var t = 0.0;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !pulsing:
		return
	const c = 0.18;
	const b = 0.39;
	const a = 0.103;
	var alpha = c * sin(t / a) + b * t;
	self_modulate = Color(self_modulate.r, self_modulate.g, self_modulate.b, alpha)
	if alpha > 1:
		pulsing = false;
	t += delta;


func _on_start_button_mouse_entered():
	self_modulate = Color(0.75, 0.75, 0.75, self_modulate.a)


func _on_start_button_mouse_exited():
	self_modulate = Color(1.0, 1.0, 1.0, self_modulate.a)
