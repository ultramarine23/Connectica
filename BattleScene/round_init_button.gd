extends Button

signal initiation_requested

func _ready():
	disabled = true
	pressed.connect(on_pressed)
	Signals.battle_started.connect(on_battle_start)
	Signals.battle_ended.connect(on_battle_end)

func on_battle_start():
	disabled = false

func on_battle_end():
	disabled = true

func on_pressed():
	## add check whether the chainers are all valid, if not return
	if Managers.chainer_manager.check_if_chainers_valid():
		initiation_requested.emit()
