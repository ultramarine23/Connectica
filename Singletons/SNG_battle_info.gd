extends Node

var player : Player
var enemies : Array[Enemy] = []

var player_intent : TurnIntent
var enemy_intents : Dictionary = {} # keys are the enemies themselves
