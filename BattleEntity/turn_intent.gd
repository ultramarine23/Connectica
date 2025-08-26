extends Resource
class_name TurnIntent

var attack_intent = 0
var block_intent = 0
var draw_intent = 0

func _init(_attack, _block, _draw):
	attack_intent = _attack
	block_intent = _block
	draw_intent = _draw
