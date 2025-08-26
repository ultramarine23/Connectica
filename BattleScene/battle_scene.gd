extends Node2D

@onready var round_init_button = $RoundInitButton

func _ready():
	BattleInfo.is_battle_over = false
	randomize()
	start_round()

func start_round():
	while BattleInfo.is_battle_over == false:
		await preexecution_phase()
		await execution_phase()
		await transition_phase()


func preexecution_phase():
	# generate enemy turn intents
	for enem in BattleInfo.enemies:
		BattleInfo.enemy_intents.append(enem.generate_intent())
	
	await round_init_button.initiation_requested
	
	# generate player turn intent
	var target = BattleInfo.enemies.front()
	var backup_targs = BattleInfo.enemies.duplicate()
	backup_targs.pop_front()
	
	var player_intent = TurnIntent.new(BattleInfo.player, target, backup_targs)
	player_intent.attack_intent = Managers.chainer_manager.get_attack()
	player_intent.block_intent = Managers.chainer_manager.get_block()
	player_intent.draw_intent = Managers.chainer_manager.get_draw()
	
	BattleInfo.player_intent = player_intent
	Managers.chainer_manager.clear_all_chainers()
	
	await get_tree().create_timer(Consts.PAUSE_DUR).timeout

func execution_phase():
	for intent in BattleInfo.enemy_intents:
		intent.execute_attack()
		await get_tree().create_timer(Consts.PAUSE_DUR).timeout
	
	BattleInfo.player_intent.execute_attack()

func transition_phase():
	pass
