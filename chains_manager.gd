extends GridContainer

signal chain_selected(chain)

func _ready():
	for child in get_children():
		child.chain_pressed.connect(on_chain_pressed)
	
	child_entered_tree.connect(on_child_entered_tree)


func on_child_entered_tree(child : Chain):
	if not child.chain_pressed.is_connected(on_chain_pressed):
		child.chain_pressed.connect(on_chain_pressed)


func on_chain_pressed(chain : Chain):
	chain_selected.emit(chain)
