extends Node2D
class_name WavesPlan

func make(count, hp, cash, speed):
	return {
		'count': count,
		'hp': hp,
		'cash': cash,
		'speed': speed,
	}
	
var waves = [
	make(3,4,5,1.0),
	make(3,6,5,.9), # heavy 
	make(3,4,5,2), # fast
	make(1,29,5,.4), # ultra heavy 
]

var total = null
var currentWave = null

func next():
	if total == null:
		total = 0
		for w in waves:
			total += w.count
	
	if (not currentWave or currentWave.count == 0):
		if (not waves.empty()):
			currentWave = waves.pop_front()
		else: 
			return null
	currentWave.count -= 1
	return currentWave


func done():
	return currentWave.count == 0 and waves.empty()
