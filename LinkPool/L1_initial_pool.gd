extends SamplePool

func _init():
	pool = {
		preload("res://Links/Operations/plus/plus.tscn") : 1,
		preload("res://Links/Numbers/number.tscn") : 2,
	}
