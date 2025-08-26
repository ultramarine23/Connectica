extends Link
class_name Number

func _init():
	link_type = Consts.NUMBER
	link_value = randi_range(1, 6)

func _ready():
	text = str(link_value)
	super()
