extends CanvasLayer

func change_scene(path):
	var anim: AnimationPlayer = $AnimationPlayer
	anim.play("fade")
	await anim.animation_finished
	Globulars.reset()
	get_tree().change_scene_to_file(path)
	anim.play_backwards("fade")
