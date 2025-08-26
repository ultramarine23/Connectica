extends Button
class_name Chain

var chain_type : int = GlobalConsts.BLOCK
var chain_value # variant variable, can be int, float or callable

signal chain_pressed(chain : Button)

func _ready():
	pressed.connect(on_pressed)

func on_pressed():
	chain_pressed.emit(self)
	get_parent().remove_child(self)
