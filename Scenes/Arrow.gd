class_name Arrow extends Node2D

var target: WeakRef = null

const speed: int = 200
var target_pos: Vector2
var velocity: Vector2

func set_target(target):
	self.target = weakref(target)

func _process(delta):
	if target.get_ref():
		target_pos = target.get_ref().get_global_transform().origin
		
	if position != target_pos:
		var vect: Vector2 = (target_pos - position)
		velocity = vect.normalized() * speed
		var increment = velocity * delta
		if not target.get_ref():
			
			modulate = Color(0,0,0,.5)
			if increment.length() > vect.length():
				print('Done here (' + str(increment.length()) + ' ' + str(vect.length()))
				queue_free() # we done here 
		position += increment
		rotation = velocity.angle()
			
	else:
		# Reached target position. 
		# If the target is still alive, our collision on it will cause 
		# us to be free'd. 
		# Otherwise, target is gone; free ourselves.
		if not target.get_ref():
			print('Freeing orphaned shot after reaching dest')
			queue_free()
		
	
	
	
