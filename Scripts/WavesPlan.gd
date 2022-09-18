extends Node2D
class_name WavesPlan

func make(count, hp, cash, speed, scale = 1.0):
	return {
		'count': count,
		'hp': hp,
		'cash': cash,
		'speed': speed,
		'scale': scale,
	}
	
var waves = [
	make(5 ,2 ,2 , 1.0 ,1.0), # normal
	make(3 ,8 ,2 , .7  ,1.1), # heavy 
	make(3 ,2 ,2 , 1.8 ,.80), # fast
	make(1 ,33,2 , .40 ,1.4), # ultra heavy 
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
