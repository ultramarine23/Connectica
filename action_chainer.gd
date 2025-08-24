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
	request_return_contents.emit(cur_chains)
	cur_chains = []
	accepting_chains = [GlobalConsts.FUNCTION, GlobalConsts.BLOCK]
	text = ""
