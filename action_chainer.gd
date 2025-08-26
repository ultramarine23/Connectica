extends Button
class_name ActionChainer

@export var chainer_type : GlobalConsts.Actions

@onready var clear_button = $ClearButton

var accepting_chains = []
var cur_chains = []

signal request_return_contents(contents : Array[Chain])

func _ready():
	toggle_mode = true
	clear_button.pressed.connect(return_contents)
	accepting_chains = [GlobalConsts.FUNCTION, GlobalConsts.BLOCK]


func add_chain(chain : Chain):
	cur_chains.append(chain)
	text += chain.text + " "
	
	match chain.chain_type:
		GlobalConsts.BLOCK:
			accepting_chains = [GlobalConsts.CONNECTOR]
		GlobalConsts.CONNECTOR:
			accepting_chains = [GlobalConsts.FUNCTION, GlobalConsts.BLOCK]
		GlobalConsts.FUNCTION:
			accepting_chains = [GlobalConsts.BLOCK]


func return_contents():
	evaluate()
	request_return_contents.emit(cur_chains)
	cur_chains = []
	accepting_chains = [GlobalConsts.FUNCTION, GlobalConsts.BLOCK]
	text = ""


func evaluate(): # algorithm for converting string of operations into an output
	var initial_value = 0
	var values_arr = []
	
	for chain in cur_chains:
		values_arr.append(chain.chain_value)
	
	if values_arr != []:
		initial_value = values_arr.front()
	else:
		return null
	
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
	
	print(initial_value)
