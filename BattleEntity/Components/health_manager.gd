extends Node
class_name EntityHealthManager

@export var max_hp : int = 100

var health : int

signal hp_depleted

func _ready():
	health = max_hp

func modify_hp(amount : int):
	health += amount
	if health <= 0:
		hp_depleted.emit()

