extends Node2D

@onready var round_init_button = $RoundInitButton

func _ready():
	round_init_button.pressed.connect(start_round)

func start_round():
	await preexecution_phase()
	await execution_phase()
	await transition_phase()


func preexecution_phase():
	# generate turn intents
	var player_attack
	var player_block
	var player_draw
	
	var player_intent = TurnIntent.new(player_attack, player_block, player_draw)

func execution_phase():
	pass

func transition_phase():
	pass
