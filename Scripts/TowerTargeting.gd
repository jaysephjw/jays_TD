extends Node


var baddies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	print($Aggro.global_position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Aggro_area_entered(area):
	#print('An area entered tower aggro ' + str(area))
	if area.is_in_group("baddie_area"):
		baddies.append(area.get_parent())


func _on_Aggro_area_exited(area):
	#print('An area exited tower aggro ' + str(area))
	if area.is_in_group("baddie_area"):
		baddies.erase(area.get_parent())
