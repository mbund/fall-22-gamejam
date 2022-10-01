extends Node

@onready var colorRect: ColorRect = $CanvasLayer/ColorRect
@onready var camera: Camera2D = $Camera2d
@onready var particles: GPUParticles2D = $GpuParticles2d2

func _process(delta):
	colorRect.material.set_shader_parameter("pos", camera.position)
	particles.position = camera.position
	Globulars.world = self
