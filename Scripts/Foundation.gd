extends Area2D


onready var game: Game = get_node('/root/Game')
const tower_price: int  = 5

func _on_Foundation_mouse_entered():
	$AggroDisplay.visible = true
	pass # Replace with function body.


func _on_Foundation_mouse_exited():
	$AggroDisplay.visible = false
	pass # Replace with function body.


func _on_Foundation_input_event(viewport, event: InputEvent, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		print(' >>> Clicked Foundation <<< ')
		if game.cash < tower_price:
			print('Not enough cash!!!')
			return
		game.cash -= tower_price
		var tower = load('res://Scenes/Tower.tscn').instance()
		get_parent().add_child_below_node(self, tower)
		tower.position = position
		get_parent().remove_child(self)
		queue_free()
		
