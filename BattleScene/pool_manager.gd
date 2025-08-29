extends Node
class_name PoolManager

var full_pool = []
var cur_pool = []

func _ready():
	Managers.pool_manager = self
	
	await Signals.battle_started
	load_sample_pool(BattleInfo.level_pool)
	refill_cur_pool()


func draw_link():
	if cur_pool.is_empty():
		refill_cur_pool()
	
	cur_pool.shuffle()
	return cur_pool.pop_front()


#func draw_link_of_category(category : int):
	#var result = draw_link()
	#var result_inst = result.instantiate()
	#
	#while category != -1 and result_inst.link_type != category:
		#result = draw_link()
		#result_inst = result.instantiate()
	#
	#return result


func refill_cur_pool():
	cur_pool = []
	for packed_scn in full_pool:
		cur_pool.append(packed_scn.instantiate())


func load_sample_pool(level_pool : SamplePool):
	full_pool.clear()
	
	for index in len(level_pool.pool.keys()):
		var scene = level_pool.pool.keys()[index]
		var count = level_pool.pool.values()[index]
		
		for i in count:
			full_pool.append(scene)
