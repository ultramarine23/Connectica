extends TextureButton
class_name Link

@onready var value_label = $Label

var link_type : int = Consts.NUMBER
var link_value # variant variable, can be int, float or callable

signal link_pressed(link : Button)

func _init():
	pass

func _ready():
	pressed.connect(on_pressed)

func on_pressed():
	link_pressed.emit(self)
	get_parent().remove_child(self)

