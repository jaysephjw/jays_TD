class_name Game extends Node2D



var _kills = 0
var cash = 10
var _leaks = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print('Game On - we ready fam')
	$Path/BaddieSpawner.spawn_baddie() # Get er started 


func _process(delta): 
	$KillCounter.text = 'Kills: ' + str(_kills)
	$KillCounter2.text = 'Cash: ' + str(cash)
	$KillCounter3.text = 'Leaks: ' + str(_leaks)
func register_kill(value):
	_kills += 1
	cash += value

func register_leak():
	_leaks += 1
