extends CanvasLayer

func change_scene(path):
	var anim: AnimationPlayer = $AnimationPlayer
	anim.play("fade")
	await anim.animation_finished
	get_tree().change_scene_to_file(path)
	anim.play_backwards("fade")
