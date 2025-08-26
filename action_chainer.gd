extends Button
class_name ActionChainer

@export var chainer_type : GlobalConsts.Actions

@onready var clear_button = $ClearButton

var accepting_links = []
var cur_links = []

signal request_return_contents(contents : Array[Link])

func _ready():
	toggle_mode = true
	clear_button.pressed.connect(return_contents)
	accepting_links = [GlobalConsts.FUNCTION, GlobalConsts.BLOCK]


func add_link(link : Link):
	cur_links.append(link)
	text += link.text + " "
	
	match link.link_type:
		GlobalConsts.BLOCK:
			accepting_links = [GlobalConsts.CONNECTOR]
		GlobalConsts.CONNECTOR:
			accepting_links = [GlobalConsts.FUNCTION, GlobalConsts.BLOCK]
		GlobalConsts.FUNCTION:
			accepting_links = [GlobalConsts.BLOCK]


func return_contents():
	request_return_contents.emit(cur_links)
	cur_links = []
	accepting_links = [GlobalConsts.FUNCTION, GlobalConsts.BLOCK]
	text = ""


func evaluate(): # algorithm for converting string of operations into an output
	if not check_if_chain_valid(cur_links):
		return null
	
	var initial_value = 0
	var values_arr = []
	
	for link in cur_links:
		values_arr.append(link.link_value)
	
	if values_arr != []:
		initial_value = values_arr.front()
	else:
		return 0
	
	var i = 0
	while i < len(values_arr) - 1:
		var operand_a = initial_value
		var operation = values_arr[i+1]
		var operand_b = values_arr[i+2]
		
		var j = 0
		while operand_b is Callable:
			j += 1
			operand_b = operand_b.call(values_arr[i+2+j])
		
		initial_value = operation.call(operand_a, operand_b)
		i += 2 + j
	
	return initial_value


func check_if_chain_valid(link : Array):
	if not link.back() is Number:
		return false
	else:
		return true
