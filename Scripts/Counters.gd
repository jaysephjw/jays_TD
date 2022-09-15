class_name Counters extends Node2D

onready var game: Game = get_node('/root/Game')

func _physics_process(delta): 
	$KillCounter.text = 'Kills: ' + str(game._kills)
	$KillCounter2.text = 'Cash: ' + str(game.cash)
	$KillCounter3.text = 'Leaks: ' + str(game._leaks)
