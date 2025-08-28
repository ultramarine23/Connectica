extends SamplePool

func _init():
	pool = {
		preload("res://Links/number.tscn") : 5,
		preload("res://Links/operation.tscn") : 5,
		preload("res://Links/function.tscn") : 5,
	}
