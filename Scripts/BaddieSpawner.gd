extends Node

#################################################
# Spawns some baddies
#################################################


var baddie_count = 0
var _baddie_scene = load('res://Scenes/Baddie.tscn')

func _ready():
	print('Spawner _ready')
	$BaddieSpawnerTimer.start()

func _on_BaddieSpawnerTimer_timeout():
	print('On Wave')
	spawn_baddie()

func spawn_baddie():
	var baddie = _baddie_scene.instance()
	baddie_count += 1
	baddie.baddie_name = "Baddie_" + str(baddie_count)
	get_parent().add_child(baddie)
