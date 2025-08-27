extends Node
class_name ChainerManager

var currently_active_chainer : ActionChainer

@onready var links_manager = $LinksManager
@onready var attack_chainer = $AttackChainer
@onready var block_chainer = $BlockChainer
@onready var draw_chainer = $DrawChainer
@onready var pool_viewer = $PoolViewer

var chainers = []
var links = []


func _ready():
	# register self into managers registry
	Managers.chainer_manager = self
	
	for child in get_children():
		if child is ActionChainer:
			chainers.append(child)
			child.button_down.connect(on_chainer_selected.bind(child))
			child.request_return_contents.connect(on_return_contents_requested)
	
	links_manager.link_selected.connect(add_link_to_chainer)
	pool_viewer.toggled.connect(on_pool_viewer_toggled)


func _process(delta):
	toggle_link_availability()


func on_chainer_selected(sel_chainer : ActionChainer):
	for chainer in chainers:
		if chainer != sel_chainer:
			chainer.set_pressed_no_signal(false)
	
	currently_active_chainer = sel_chainer


func toggle_link_availability():
	for link in links_manager.get_children():
		if currently_active_chainer == null:
			link.disabled = true
		elif currently_active_chainer.accepting_links.has(link.link_type):
			link.disabled = false
		else:
			link.disabled = true


func add_link_to_chainer(link : Link):
	currently_active_chainer.add_link(link)


func on_return_contents_requested(contents : Array):
	for link in contents:
		links_manager.add_child(link)

## ===== API functions ======
func get_attack():
	return attack_chainer.evaluate()

func get_block():
	return block_chainer.evaluate()

func get_draw():
	return draw_chainer.evaluate()

func check_if_chainers_valid():
	if get_attack() == null:
		return false
	elif get_block() == null:
		return false
	elif get_draw() == null:
		return false
	else:
		return true

func clear_all_chainers():
	attack_chainer.clear_links()
	block_chainer.clear_links()
	draw_chainer.clear_links()


func on_pool_viewer_toggled():
	pass
