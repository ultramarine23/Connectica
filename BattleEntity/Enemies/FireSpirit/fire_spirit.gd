extends Enemy

func _ready():
	stats_res = load("res://BattleEntity/Enemies/FireSpirit/fire_spirit_stats.tres")
	super()

func _factor_in_weaknesses(init_damage : int) -> int:
	if init_damage % 3 == 0:
		return init_damage * 2
	else:
		return init_damage
