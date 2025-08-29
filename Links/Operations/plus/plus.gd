extends Operation

func _init():
	link_icon = "res://Links/Operations/plus/plus_icon.tscn"
	link_value = sum
	super()

func sum(a, b):
	return float(a) + float(b)
