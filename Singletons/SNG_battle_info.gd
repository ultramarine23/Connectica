extends Node

var level_pool : SamplePool
var room_number = 1
var extra_difficulty_pts = 0

var player : Player = preload("res://BattleEntity/Player/player.tscn").instantiate()
var enemies : Array[Enemy] = []

var player_intent : TurnIntent
var enemy_intents : Array = []

var is_battle_over = false
var is_battle_won = false

var enemy_costs : Dictionary = {
	preload("res://BattleEntity/Enemies/Slime/slime.tscn") : 20,
	preload("res://BattleEntity/Enemies/Goblin/goblin.tscn") : 50,
	preload("res://BattleEntity/Enemies/FireSpirit/fire_spirit.tscn") : 100,
}
