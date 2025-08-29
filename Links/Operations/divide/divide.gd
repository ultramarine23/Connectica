extends Operation

func _init():
	link_icon = "res://Links/Operations/divide/divide_icon.tscn"
	link_value = quotient
	super()

func quotient(a, b):
	return float(a) / float(b)
