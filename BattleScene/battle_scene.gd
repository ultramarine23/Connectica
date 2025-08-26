extends Node2D

@onready var round_init_button = $RoundInitButton

func _ready():
	start_round()

func start_round():
	await preexecution_phase()
	await execution_phase()
	await transition_phase()


func preexecution_phase():
	# generate enemy turn intents + !!!!!display them!!!!!
	for enem in BattleInfo.enemies:
		BattleInfo.enemy_intents[enem] = enem.generate_intent()
	
	await round_init_button.initiation_requested
	
	# generate player turn intents
	BattleInfo.player_intent = TurnIntent.new(
		Managers.chainer_manager.get_attack(), 
		Managers.chainer_manager.get_block(),
		Managers.chainer_manager.get_draw()
		)

func execution_phase():
	pass

func transition_phase():
	pass
