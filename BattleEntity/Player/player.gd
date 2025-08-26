extends BattleEntity
class_name Player

func _ready():
	BattleInfo.player = self
	super()
