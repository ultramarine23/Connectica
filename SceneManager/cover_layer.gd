extends CanvasLayer

@onready var color_rect = $ColorRect

func cover_screen(anim_time : float):
	var new_tween = create_tween()
	new_tween.tween_property(color_rect, "position:x", 0, anim_time)
	await new_tween.finished

func uncover_screen(anim_time : float):
	var new_tween = create_tween()
	new_tween.tween_property(color_rect, "position:x", -960, anim_time)
	await new_tween.finished
	color_rect.position.x = 960
