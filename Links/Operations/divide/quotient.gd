extends Operation

func _init():
	link_value = quotient
	super()

func quotient(a, b):
	return float(a) / float(b)
