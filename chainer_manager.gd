extends Node

var currently_active_chainer : ActionChainer

@onready var chains_manager = $ChainsManager

var chainers = []
var chains = []


func _ready():
	for child in get_children():
		if child is ActionChainer:
			chainers.append(child)
			child.button_down.connect(on_chainer_selected.bind(child))
	
	chains_manager.chain_selected.connect(add_chain_to_chainer)


func _process(delta):
	toggle_chain_availability()


func on_chainer_selected(sel_chainer : ActionChainer):
	for chainer in chainers:
		if chainer != sel_chainer:
			chainer.set_pressed_no_signal(false)
	
	currently_active_chainer = sel_chainer


func toggle_chain_availability():
	for chain in chains_manager.get_children():
		if currently_active_chainer == null:
			chain.disabled = true
		elif currently_active_chainer.accepting_chains.has(chain.chain_type):
			chain.disabled = false
		else:
			chain.disabled = true


func add_chain_to_chainer(chain : Chain):
	currently_active_chainer.add_chain(chain)
