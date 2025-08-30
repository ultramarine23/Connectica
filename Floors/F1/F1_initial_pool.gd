extends SamplePool

func _init():
	pool = {
		preload("res://Links/Operations/times/times.tscn") : 8,
		preload("res://Links/Numbers/number.tscn") : 10,
	}
