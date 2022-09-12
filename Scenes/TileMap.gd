extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var _tower: Texture = load('res://Textures/tower.png')

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var pos = world_to_map(event.position)
		var tile_id = get_cellv(pos)
		var tile_name = tile_set.tile_get_name(tile_id)
		print("Clicked tile " + tile_name + " at " + str(pos))
		if 'foundation' in tile_name:
			set_cellv(pos, 3)

