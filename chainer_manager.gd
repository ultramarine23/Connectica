extends Node

var currently_active_chainer : ActionChainer

@onready var links_manager = $ChainsManager

var chainers = []
var links = []


func _ready():
	for child in get_children():
		if child is ActionChainer:
			chainers.append(child)
			child.button_down.connect(on_chainer_selected.bind(child))
			child.request_return_contents.connect(on_return_contents_requested)
	
	links_manager.link_selected.connect(add_link_to_chainer)


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
