extends Node

signal pool_chosen(chosen_pool : SamplePool)

func _ready():
	for pool_sel in get_children():
		pool_sel.pressed.connect(on_pool_sel_pressed.bind(pool_sel))


func on_pool_sel_pressed(pool_sel):
	BattleInfo.level_pool = pool_sel.sample_pool
	pool_chosen.emit()
