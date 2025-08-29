extends Node2D

@onready var pool_selector_manager = $PoolSelectorManager

func _ready():
	pool_selector_manager.pool_chosen.connect(on_pool_chosen)


func on_pool_chosen():
	Signals.scene_transition_requested.emit(self, Consts.BATTLE_SCNPATH)
