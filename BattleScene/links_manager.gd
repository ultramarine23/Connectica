extends GridContainer
class_name LinksManager

signal link_selected(link)


func _ready():
	for child in get_children():
		child.link_pressed.connect(on_link_pressed)
	
	child_entered_tree.connect(on_child_entered_tree)
	Managers.links_manager = self


func on_child_entered_tree(child : Link):
	if not child.link_pressed.is_connected(on_link_pressed):
		child.link_pressed.connect(on_link_pressed)


func generate_links():
	pass


func draw_links(count : int, type : int = -1):
	for i in count:
		if get_child_count() >= 15:
			return
		
		var link = BattleInfo.level_rarity_table.draw_link(type)
		var link_inst = link.instantiate()
		add_child(link_inst)


func on_link_pressed(link : Link):
	link_selected.emit(link)
