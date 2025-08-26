extends BattleEntity
class_name Enemy

@export var stats_res : Resource

func _ready():
	health_manager.max_hp = stats_res.max_health
	BattleInfo.enemies.append(self)
	super()

func generate_intent():
	# calculate damage based on str stat
	var damage : float = float(stats_res.strength)
	damage += randf_range(-0.2, 0.2) * damage
	damage = round(damage)
	
	# take accuracy into account
	if randi_range(0, 100) > stats_res.accuracy:
		damage = 0
	
	var turn_intent = TurnIntent.new(damage, 0, 0)
	return turn_intent

