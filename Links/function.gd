extends Link
class_name Function

func _init():
	link_type = Consts.FUNCTION
	link_value = percentage
	text = "%"

func percentage(a):
	return float(a) / 100
