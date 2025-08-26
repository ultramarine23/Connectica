extends Node2D
class_name BattleEntity

@onready var health_manager : EntityHealthManager = $HealthManager

var is_dead : bool = false
var next_turn_intent : TurnIntent = null

func _ready():
	health_manager.hp_depleted.connect(on_hp_depleted)


func receive_attack(damage_dealt : int):
	health_manager.deduct_hp(damage_dealt)


func on_hp_depleted():
	is_dead = true
	queue_free()
