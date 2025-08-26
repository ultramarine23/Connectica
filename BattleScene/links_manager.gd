extends GridContainer

signal link_selected(link)

func _ready():
	for child in get_children():
		child.link_pressed.connect(on_link_pressed)
	
	child_entered_tree.connect(on_child_entered_tree)
	
	await get_tree().current_scene.ready
	draw_links(3, Consts.NUMBER)
	draw_links(2)


func on_child_entered_tree(child : Link):
	if not child.link_pressed.is_connected(on_link_pressed):
		child.link_pressed.connect(on_link_pressed)


func generate_links():
	pass


func draw_links(count : int, type : int = -1):
	for i in count:
		var link = BattleInfo.level_rarity_table.draw_link(type)
		var link_inst = link.instantiate()
		add_child(link_inst)


func on_link_pressed(link : Link):
	link_selected.emit(link)
