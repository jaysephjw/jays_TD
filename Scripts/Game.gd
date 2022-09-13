extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print('Game On - we ready fam')
	$Path/BaddieSpawner.spawn_baddie() # Get er started 
