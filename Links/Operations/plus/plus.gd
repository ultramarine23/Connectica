extends Operation

func _init():
	link_value = sum
	super()

func sum(a, b):
	return float(a) + float(b)
