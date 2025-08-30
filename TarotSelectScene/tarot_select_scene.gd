extends Node2D

@onready var tarots_container = $TarotsContainer

func _ready():
	for tarot_card in tarots_container.get_children():
		tarot_card.tarot_selected.connect(on_tarot_selected)


func generate_tarots():
	pass


func on_tarot_selected(event_scene : PackedScene):
	Signals.scene_transition_requested.emit(self, event_scene)
