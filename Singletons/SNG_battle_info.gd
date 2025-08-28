extends Node

var level_pool : SamplePool

var player : Player
var enemies : Array[Enemy] = []

var player_intent : TurnIntent
var enemy_intents : Array = []

var is_battle_over = false
