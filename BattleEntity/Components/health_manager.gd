extends Node2D
class_name EntityHealthManager

@onready var health_bar = $HealthBar

@export var max_hp : int = 100

var health : int
var block : int

signal hp_depleted

func _ready():
	health = max_hp
	GlobalSignals.round_ended.connect(on_round_end)

func deduct_hp(amount : int):
	# take block into consideration
	amount -= block
	if amount < 0:
		block = -amount
		amount = 0
	
	health -= amount
	health_bar.size.x = 96 * float(health) / float(max_hp)
	if health <= 0:
		hp_depleted.emit()

func add_block(amount : int):
	block += amount

func on_round_end():
	# reset block
	block = 0
