extends Node2D
class_name EntityHealthManager

@onready var health_bar = $HealthBar
@onready var health_label = $HealthLabel
@onready var block_label = $BlockLabel

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
	var diff = amount - block
	if diff > 0:
		amount -= block
		block = 0
	elif diff < 0:
		block -= amount
		amount = 0
	else:
		block = 0
		amount = 0
	
	health -= amount
	update_health_ui()
	
	if health <= 0:
		hp_depleted.emit()

func update_health_ui():
	health_bar.size.x = 96 * float(health) / float(max_hp)
	health_label.text = str(health) + " / " + str(max_hp)
	
	if block > 0:
		block_label.text = "block: " + str(block)
		block_label.show()
	else:
		block_label.hide()


func add_block(amount : int):
	block += amount
	update_health_ui()


func reset_block():
	block = 0
	update_health_ui()


func on_round_end():
	# reset block
	block = 0
