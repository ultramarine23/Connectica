extends Link
class_name Function

func _init():
	link_type = Consts.FUNCTION
	link_value = percentage

func percentage(a):
	return float(a) / 100
