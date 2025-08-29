extends Node

var level_pool : SamplePool

var player : Player = preload("res://BattleEntity/Player/player.tscn").instantiate()
var enemies : Array[Enemy] = []

var player_intent : TurnIntent
var enemy_intents : Array = []

var is_battle_over = false
var is_battle_won = false
