extends Node2D
class_name EntityHealthManager

@onready var health_bar = $HealthBar
@onready var health_label = $HealthLabel

@export var max_hp : int = 100

var health : int
var block : int

signal hp_depleted

func _ready():
	Signals.round_ended.connect(on_round_end)

func initialize_hp():
	health = max_hp
	update_health_ui()

func deduct_hp(amount : int):
	# take block into consideration
	amount -= block
	if amount < 0:
		block = -amount
		amount = 0
	
	health -= amount
	update_health_ui()
	
	if health <= 0:
		hp_depleted.emit()

func update_health_ui():
	health_bar.size.x = 96 * float(health) / float(max_hp)
	health_label.text = str(health) + " / " + str(max_hp)


func add_block(amount : int):
	block += amount

func on_round_end():
	# reset block
	block = 0
