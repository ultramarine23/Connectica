extends Node2D

@onready var cover_layer = $CoverLayer

func _ready():
	Signals.scene_transition_requested.connect(transition_scenes)


func transition_scenes(cur_scene, new_scene):
	await cover_layer.cover_screen(0.5)
	
	cur_scene.queue_free()
	add_child(new_scene)
	
	await cover_layer.uncover_screen(0.5)
