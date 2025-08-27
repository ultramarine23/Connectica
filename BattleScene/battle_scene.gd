extends Node2D

@onready var round_init_button = $RoundInitButton

func _ready():
	BattleInfo.is_battle_over = false
	BattleInfo.level_rarity_table = preload("res://L1_rarity_table.tres")
	randomize()
	await get_tree().create_timer(Consts.PAUSE_DUR).timeout
	
	await do_battle()
	Signals.battle_ended.emit()


func do_battle():
	Signals.battle_started.emit()
	Managers.links_manager.draw_links(3, Consts.NUMBER)
	Managers.links_manager.draw_links(1, Consts.OPERATION)
	Managers.links_manager.draw_links(1, Consts.FUNCTION)
	
	while BattleInfo.is_battle_over == false:
		Signals.round_started.emit()
		if await preexecution_phase() == Consts.CODE_BATTLE_OVER:
			print("RAH")
			return
		if await execution_phase() == Consts.CODE_BATTLE_OVER:
			print("RAH")
			return
		if await transition_phase() == Consts.CODE_BATTLE_OVER:
			print("RAH")
			return
		Signals.round_ended.emit()


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
	BattleInfo.player_intent.execute_block()
	await get_tree().create_timer(Consts.MED_PAUSE_DUR).timeout
	
	for intent in BattleInfo.enemy_intents:
		intent.execute_attack()
		await get_tree().create_timer(Consts.MED_PAUSE_DUR).timeout
		
		if check_if_battle_over():
			return Consts.CODE_BATTLE_OVER
	
	BattleInfo.player_intent.execute_attack()
	await get_tree().create_timer(Consts.MED_PAUSE_DUR).timeout
	
	if check_if_battle_over():
		return Consts.CODE_BATTLE_OVER


func transition_phase():
	BattleInfo.enemy_intents.clear()
	
	var additional_draws = floor(float(BattleInfo.player_intent.draw_intent) / 5.0)
	Managers.links_manager.draw_links(3 + additional_draws)
	
	BattleInfo.player.health_manager.reset_block()
	
	await get_tree().create_timer(Consts.LONG_PAUSE_DUR).timeout


func check_if_battle_over():
	print(BattleInfo.enemies, BattleInfo.player)
	if BattleInfo.enemies == [] or BattleInfo.player == null:
		return true
	else:
		return false
