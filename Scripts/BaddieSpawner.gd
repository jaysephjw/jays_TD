extends Node

#################################################
# Spawns some baddies
#################################################

var baddie_count = 0
var _baddie_scene = load('res://Scenes/Baddie.tscn')

onready var game: Game = get_node('/root/Game')

func _ready():
	print('Spawner _ready')
	$BaddieSpawnerTimer.start()


func _on_BaddieSpawnerTimer_timeout():
	print('On Wave')
	spawn_baddie()
	if (game.waves.done()):
		$BaddieSpawnerTimer.stop()
		print("Last baddie Spawned")


func spawn_baddie():
	baddie_count += 1
	var baddie: Baddie = _baddie_scene.instance()
	baddie.baddie_name = "Baddie_" + str(baddie_count)
	var config = game.waves.next()
	baddie.hp = config.hp
	baddie.cash_value = config.cash
	baddie.movement_per_second = config.speed
	baddie.scale = Vector2(config.scale, config.scale)
	
	
	get_parent().add_child(baddie)
