extends Button

signal initiation_requested

func _ready():
	pressed.connect(on_pressed)

func on_pressed():
	## add check whether the chainers are all valid, if not return
	if Managers.chainer_manager.check_if_chainers_valid():
		initiation_requested.emit()
