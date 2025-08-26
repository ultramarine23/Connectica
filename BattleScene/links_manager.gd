extends GridContainer

signal link_selected(link)

func _ready():
	for child in get_children():
		child.link_pressed.connect(on_link_pressed)
	
	child_entered_tree.connect(on_child_entered_tree)


func on_child_entered_tree(child : Link):
	if not child.link_pressed.is_connected(on_link_pressed):
		child.link_pressed.connect(on_link_pressed)


func generate_links():
	pass
func on_link_pressed(link : Link):
	link_selected.emit(link)
