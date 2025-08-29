extends TextureButton
class_name Link

@onready var value_label = $Label

var link_type : int = Consts.NUMBER
var link_value # variant variable, can be int, float or callable

signal link_pressed(link : Button)

func _init():
	pass

func _ready():
	value_label.pivot_offset = value_label.size / 2
	value_label.scale = Vector2.ONE
	pressed.connect(on_pressed)
	mouse_entered.connect(on_hovered)
	mouse_exited.connect(on_unhovered)
	button_down.connect(on_button_down)
	button_up.connect(on_button_up)

func on_button_down():
	value_label.scale = Vector2(0.8, 0.8)

func on_button_up():
	value_label.scale = Vector2(1, 1)

func on_hovered():
	value_label.scale = Vector2(0.8, 0.8)

func on_unhovered():
	value_label.scale = Vector2(1, 1)

func on_pressed():
	link_pressed.emit(self)
	get_parent().remove_child(self)

