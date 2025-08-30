extends Button

@export var bound_scnpath : String
@export var extra_difficulty_pts = 0

signal tarot_selected(scene : PackedScene)

func _ready():
	pressed.connect(on_pressed)

func on_pressed():
	BattleInfo.extra_difficulty_pts += extra_difficulty_pts
	var scene = load(Consts.BATTLE_SCNPATH).instantiate()
	tarot_selected.emit(scene)
