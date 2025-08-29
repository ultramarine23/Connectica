extends Node
class_name EntityManager

@export var enemy_list : Array[String]

func _ready():
	Managers.entity_manager = self
	initiate_enemies(enemy_list)


func initiate_enemies(enemypath_list : Array):
	var enemy_posns = get_enemy_positions(len(enemypath_list))
	for i in len(enemypath_list):
		var enemypath = enemypath_list[i]
		var enemy_inst = load(enemypath).instantiate()
		
		add_child(enemy_inst)
		enemy_inst.global_position = enemy_posns[i]
		
		BattleInfo.enemies.append(enemy_inst)


func get_enemy_positions(pos_count : int):
	var base_pos_x = 496
	var pos_y = 216
	
	match pos_count:
		1:
			return [Vector2(base_pos_x + 160, pos_y)]
		2:
			return [
				Vector2(base_pos_x + 100, pos_y),
				Vector2(base_pos_x + 220, pos_y)
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
