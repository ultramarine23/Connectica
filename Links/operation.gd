extends Link
class_name Operation

func _init():
	link_type = Consts.OPERATION
	link_value = sum


func sum(a, b):
	return float(a) + float(b)

func product(a, b):
	return float(a) * float(b)

func quotient(a, b):
	return float(a) / float(b)

func difference(a, b):
	return float(a) - float(b)
