extends Operation

func _init():
	link_value = product
	super()

func product(a, b):
	return float(a) * float(b)
