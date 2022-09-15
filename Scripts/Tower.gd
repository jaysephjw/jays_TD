class_name Tower extends Area2D

# -------------------------------------------------
# -- General State --------------------------------

onready var game: Game = get_node('/root/Game')

# -------------------------------------------------
# -- General Hooks --------------------------------

func _ready():
	pass # Replace with function body.


# -------------------------------------------------
# -- Placement ------------------------------------

#var foundations = []


#func _is_placeable():
#	return not placed and not foundations.empty()


# -------------------------------------------------
# -- Aggro ----------------------------------------
 
var baddies: Array = []
var _aggro_target = null

var reset_color = Color(1,1,1) # white
var aggro_color = Color(.65,0,0) # darkish red

func get_target():
	if _aggro_target != null:
		return _aggro_target
	elif not baddies.empty():
		_aggro_target = baddies.back() # .first to target oldest
		return _aggro_target
	else:
		return null

func _on_Tower_mouse_entered():
	$AggroDisplay.visible = true

func _on_Tower_mouse_exited():
	$AggroDisplay.visible = false

func _on_Aggro_area_entered(area):
	if not area.is_in_group("baddie_area"):
		return
	_add_aggro(area.get_parent())

func _on_Aggro_area_exited(area):
	if not area.is_in_group("baddie_area"):
		return
	_drop_aggro(area.get_parent())

func _add_aggro(baddie: Baddie):
	print('add aggro for ' + str(baddie))
	baddie.tower_aggros += 1
	if baddie.tower_aggros == 1:
		baddie.modulate = aggro_color
	baddies.append(baddie)


func _drop_aggro(baddie: Baddie):
	baddie.tower_aggros -= 1
	if baddie.tower_aggros == 0:
		baddie.modulate = reset_color
	baddies.erase(baddie)
	if baddie == _aggro_target:
		_aggro_target = null


# -------------------------------------------------
# -- `Shots, shots shots, shots shots!` -----------

var _arrow = load('res://Scenes/Arrow.tscn')

func _on_ShotTimer_timeout():
	# print('timeout. target is ' + str(baddies) + ' baddies empty ' + str(baddies.empty()))
	var target = get_target()
	if not target:
		return
	var arrow: Arrow = _arrow.instance()
	arrow.position = get_global_position()
	arrow.set_target(target)
	self.get_parent().add_child(arrow)
	# print('took shot')
