extends RarityTable

func _init():
	number_table = {
		preload("res://Links/number.tscn") : 100,
	}
	
	operation_table = {
		preload("res://Links/operation.tscn") : 100,
	}
	
	function_table = {
		preload("res://Links/function.tscn") : 100,
	}
	
	category_chances = {
		Consts.NUMBER : 90,
		Consts.OPERATION : 5,
		Consts.FUNCTION : 5,
	}
	super()
