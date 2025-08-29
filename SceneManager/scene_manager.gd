extends Node2D

@onready var cover_layer = $CoverLayer

func _ready():
	Signals.scene_transition_requested.connect(transition_scenes)


func transition_scenes(cur_scene, new_scnpath):
	await cover_layer.cover_screen(0.5)
	
	cur_scene.queue_free()
	var new_scene_inst = load(new_scnpath).instantiate()
	add_child(new_scene_inst)
	
	await cover_layer.uncover_screen(0.5)
