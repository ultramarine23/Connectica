extends Operation

func _init():
	link_icon = "res://Links/Operations/minus/minus_icon.tscn"
	link_value = difference
	super()

func difference(a, b):
	return float(a) - float(b)
