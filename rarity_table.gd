extends Resource
class_name RarityTable

var number_table : Dictionary
var operation_table : Dictionary
var function_table : Dictionary

@export var category_chances : Dictionary = {
	Consts.NUMBER : 50,
	Consts.OPERATION : 35,
	Consts.FUNCTION : 15,
}

func _init():
	pass


func draw_link(category : int = -1):
	if category == -1:
		category = pick_category()
	
	match category:
		Consts.NUMBER:
			return pick_random_weighted(number_table.keys(), number_table.values())
		Consts.OPERATION:
			return pick_random_weighted(operation_table.keys(), operation_table.values())
		Consts.FUNCTION:
			return pick_random_weighted(function_table.keys(), function_table.values())


func pick_category():
	return pick_random_weighted(category_chances.keys(), category_chances.values())


func pick_random_weighted(_items : Array, _weights : Array):
	var items = _items.duplicate()
	var weights = _weights.duplicate()
	
	var total_weight = 0
	for i in weights:
		total_weight += i
	
	var rand = randi_range(0, total_weight)
	var selected_weight = 0
	for i in weights:
		if rand < i:
			selected_weight = i
			break
		rand -= i
	
	var index_of_weight = weights.find(selected_weight)
	return items[index_of_weight]
