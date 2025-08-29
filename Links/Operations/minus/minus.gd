extends Operation

func _init():
	link_value = difference
	super()

func difference(a, b):
	return float(a) - float(b)
