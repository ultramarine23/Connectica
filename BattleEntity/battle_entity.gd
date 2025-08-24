extends Node2D
class_name BattleEntity

@onready var health_manager : EntityHealthManager = $HealthManager

var is_dead : bool = false

func _ready():
	health_manager.hp_depleted.connect(on_hp_depleted)


func on_hp_depleted():
	is_dead = true
	queue_free()
