extends Node
class_name EntityManager

func _ready():
	Managers.entity_manager = self


func initiate_battle_entities(enemypath_list : Array):
	var player = BattleInfo.player
	add_child(player)
	
	for enemypath in enemypath_list:
		var enemy_inst = load(enemypath).instantiate()
		add_child(enemy_inst)
		BattleInfo.enemies.append(enemy_inst)
