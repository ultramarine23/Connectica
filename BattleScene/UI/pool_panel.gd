extends TextureRect

@onready var grid_cont = $GridContainer

func display_probabilities():
	for child in grid_cont.get_children():
		child.queue_free()
	
	for link in Managers.pool_manager.cur_pool:
		var icon_path = link.link_icon
		var icon_inst = load(icon_path).instantiate()
		grid_cont.add_child(icon_inst)
