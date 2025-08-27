extends Button
class_name Link

@onready var popup = $Popup

var link_type : int = Consts.NUMBER
var link_value # variant variable, can be int, float or callable

var pool_display_mode : bool = false

signal link_pressed(link : Button)

func _ready():
	pressed.connect(on_pressed)
	mouse_entered.connect(on_hovered)
	mouse_exited.connect(on_unhovered)
	popup.hide()

func on_pressed():
	if not pool_display_mode:
		link_pressed.emit(self)
		get_parent().remove_child(self)

func on_hovered():
	if pool_display_mode:
		popup.show()

func on_unhovered():
	popup.hide()


func switch_to_pool_display_mode():
	pool_display_mode = true
