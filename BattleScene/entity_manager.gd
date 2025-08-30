extends Node
class_name EntityManager

@export var enemy_list : Array[String]

var player

func _ready():
	initiate_player()
	Managers.entity_manager = self
	initiate_enemies(generate_enemies())
	Signals.battle_ended.connect(on_battle_end)


func initiate_player():
	player = BattleInfo.player
	player.global_position = Vector2(192, 216)
	add_child(player)


func generate_enemies() -> Array:
	var difficulty_pts = (BattleInfo.room_number * 30) + BattleInfo.extra_difficulty_pts
	BattleInfo.extra_difficulty_pts = 0
	var enemies_arr : Array = BattleInfo.enemy_costs.keys()
	var costs_arr : Array = BattleInfo.enemy_costs.values()
	var selected_enemies = []
	
	difficulty_pts = round(float(difficulty_pts) * randf_range(0.7, 1.3))
	print("DIFFICULTY POINTS : ", difficulty_pts)
	costs_arr.shuffle()
	costs_arr.sort() # sorts the array in ascending order
	costs_arr.reverse() # array is now in descending order
	
	var lowest_cost = costs_arr.back()
	
	while (difficulty_pts >= lowest_cost) and (len(selected_enemies) < 4):
		for cost in costs_arr:
			if cost <= difficulty_pts:
				difficulty_pts -= cost
				selected_enemies.append(BattleInfo.enemy_costs.find_key(cost))
				break
	
	var unselected_enemies = difference_arr(enemies_arr, selected_enemies)
	for enem in unselected_enemies:
		deflate_enemy_price(enem)
	for enem in selected_enemies:
		inflate_enemy_price(enem)
	
	return selected_enemies


func inflate_enemy_price(packed_scn):
	BattleInfo.enemy_costs[packed_scn] *= 1.2

func deflate_enemy_price(packed_scn):
	BattleInfo.enemy_costs[packed_scn] *= 0.8


func initiate_enemies(enemy_list : Array):
	# spawn enemies
	var enemy_posns = get_enemy_positions(len(enemy_list))
	for i in len(enemy_list):
		var enemy = enemy_list[i]
		var enemy_inst = enemy.instantiate()
		
		add_child(enemy_inst)
		enemy_inst.global_position = enemy_posns[i]
		
		BattleInfo.enemies.append(enemy_inst)


func get_enemy_positions(pos_count : int):
	var base_pos_x = 496
	var pos_y = 216
	
	match pos_count:
		1:
			return [Vector2(base_pos_x + 250, pos_y)]
		2:
			return [
				Vector2(base_pos_x + 100, pos_y),
				Vector2(base_pos_x + 250, pos_y)
				]
		3:
			return [
				Vector2(base_pos_x + 40, pos_y),
				Vector2(base_pos_x + 160, pos_y),
				Vector2(base_pos_x + 280, pos_y)
				]
		4:
			return [
				Vector2(base_pos_x + 0, pos_y),
				Vector2(base_pos_x + 110, pos_y),
				Vector2(base_pos_x + 220, pos_y),
				Vector2(base_pos_x + 330, pos_y)
				]


func on_battle_end():
	remove_child(player)


func difference_arr(arr1, arr2):
	var only_in_arr1 = []
	for v in arr1:
		if not (v in arr2):
			only_in_arr1.append(v)
	return only_in_arr1

#func calculate_enemy_positions(pos_count : int, middle_pos : Vector2) -> Array:
	#var positions_arr = []
	#var middle_x = middle_pos.x
	#
	#for i in pos_count:
		#var pos_x = i * 128
		#pos_x -= (i * 128 / 2)
		#positions_arr.append(Vector2(i * 128, middle_pos.y))
	#
	#if pos_count % 2 == 0:
		#pass
	#else:
		#pass
	#
	#return positions_arr
