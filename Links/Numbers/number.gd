extends Link
class_name Number

func _init():
	link_type = Consts.NUMBER


func _ready():
	value_label.text = str(link_value)
	super()
