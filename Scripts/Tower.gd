extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# -------------------------------------------------
# -- Placement ------------------------------------



# -------------------------------------------------
# -- Aggro ----------------------------------------
 
var baddies = []

var reset_color = Color(1,1,1) # white
var aggro_color = Color(.65,0,0) # darkish red

func _on_Aggro_area_entered(area):
	# print('Tower ' + to_string() + ' ENTER aggro ' + str(area))
	if area.is_in_group("baddie_area"):
		_add_aggro(area.get_parent())

func _on_Aggro_area_exited(area):
	# print('Tower ' + to_string() + ' EXIT aggro ' + str(area))
	if area.is_in_group("baddie_area"):
		_drop_aggro(area.get_parent())

func _add_aggro(baddie: Baddie):
	baddie.tower_aggros += 1
	if baddie.tower_aggros == 1:
		baddie.modulate = aggro_color
	baddies.append(baddie)

func _drop_aggro(baddie: Baddie):
	baddie.tower_aggros -= 1
	if baddie.tower_aggros == 0:
		baddie.modulate = reset_color
	baddies.erase(baddie)

# -------------------------------------------------
# -------------------------------------------------
