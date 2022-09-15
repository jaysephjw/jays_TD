class_name Baddie extends PathFollow2D


const cell_size = 64
var movement_per_second = 1
var cash_value = 2
var hp = 4

onready var game: Game = get_node('/root/Game')
var baddie_name = to_string()

var time_alive = 0


# Counts the number of towers agrro'd onto this baddie
var tower_aggros = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(baddie_name + " spawned")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Move offset based on it's time alive.
	time_alive += delta
	offset = time_alive * cell_size * movement_per_second 
	# If it's at/past the end of the path, destroy this node.
	if unit_offset >= 1:
		print(">>> !!! " + baddie_name + " got free !!! <<<")
		game.register_leak()
		queue_free() # engine-speak for "GTFO"

# Clicked on me!
func _on_Area2D_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Clicked on Baddie " + baddie_name)


func _on_BaddieArea_area_entered(area):
	if not area.is_in_group("shot"): return
	#print('Youch!')
	hp -= 1
	area.queue_free()
	
	if hp <= 0:
		#print(baddie_name + ' is le Ded')
		game.register_kill(cash_value)
		queue_free()
		
		
