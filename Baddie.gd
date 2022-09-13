extends PathFollow2D
class_name Baddie

const cell_size = 64
const movement_per_second = 1

var baddie_name = to_string()
var time_alive = 0

# Counts the number of towers agrro'd onto this baddie
var tower_aggros = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(">>> " + baddie_name + " is ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Move offset based on it's time alive.
	time_alive += delta
	offset = time_alive * cell_size * movement_per_second 
	# If it's at/past the end of the path, destroy this node.
	if unit_offset >= 1:
		print(">>> " + baddie_name + " is free")
		queue_free() # engine-speak for "GTFO"


# Clicked on me!
func _on_Area2D_input_event(viewport, event, shape_idx):
	print("Mouse on Baddie " + baddie_name)

