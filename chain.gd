extends Button
class_name Chain

var chain_type : int = GlobalConsts.BLOCK

signal chain_pressed(chain : Button)

func _ready():
	pressed.connect(on_pressed)

func on_pressed():
	chain_pressed.emit(self)
	get_parent().remove_child(self)
