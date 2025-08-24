extends Node2D
class_name EntityHealthManager

@onready var full_bar = $FullBar

@export var max_hp : int = 100

var health : int

signal hp_depleted

func _ready():
	health = max_hp

func modify_hp(amount : int):
	health += amount
	full_bar.size.x = 96 * float(health) / float(max_hp)
	if health <= 0:
		hp_depleted.emit()

