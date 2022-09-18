class_name Game extends Node2D

var cash = 8
var _kills = 0
var _leaks = 0
var gg = false
var start_shown = false

onready var waves = $WavesPlan

# Called when the node enters the scene tree for the first time.
func _ready():
	print('Game On - we ready fam')

func register_kill(value):
	_kills += 1
	cash += value

func register_leak():
	_leaks += 1

func _process(delta):
	if not start_shown:
		start_shown = true
		OS.alert('Get the big guy to win')
	
	if not gg and (_kills + _leaks == waves.total):
		gg = true
		yield(get_tree(), "idle_frame")
		OS.alert('GG')
