extends Operation

func _init():
	link_icon = "res://Links/Operations/times/times_icon.tscn"
	link_value = product
	super()

func product(a, b):
	return float(a) * float(b)
