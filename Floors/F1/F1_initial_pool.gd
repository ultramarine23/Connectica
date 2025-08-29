extends SamplePool

func _init():
	Engine.time_scale = 3
	pool = {
		preload("res://Links/Operations/times/times.tscn") : 8,
		preload("res://Links/Numbers/number.tscn") : 10,
	}
