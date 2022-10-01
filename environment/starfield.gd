extends Node

@onready var colorRect: ColorRect = $Background/Nebulae
@onready var camera: Camera2D = $Camera2d

@onready var particles: GPUParticles2D = $Starfield

func _ready():
	Globulars.world = self

func _process(delta):
	colorRect.material.set_shader_parameter("pos", camera.position)
	particles.position = camera.position
