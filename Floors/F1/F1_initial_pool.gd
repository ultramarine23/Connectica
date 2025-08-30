extends SamplePool

func _init():
	pool = {
		preload("res://Links/Operations/times/times.tscn") : 5,
		preload("res://Links/Operations/minus/minus.tscn") : 5,
		preload("res://Links/Numbers/neg_one/neg_one.tscn") : 4,
		preload("res://Links/Numbers/one/one.tscn") : 4,
		preload("res://Links/Numbers/two/two.tscn") : 4,
		preload("res://Links/Numbers/three/three.tscn") : 4,
		preload("res://Links/Operations/plus/plus.tscn") : 5,
	}
