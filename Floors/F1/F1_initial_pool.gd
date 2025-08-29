extends SamplePool

func _init():
	pool = {
		preload("res://Links/Operations/plus/plus.tscn") : 8,
		preload("res://Links/Operations/minus/minus.tscn") : 8,
		preload("res://Links/Numbers/number.tscn") : 8,
	}
