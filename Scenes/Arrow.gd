class_name Arrow extends Node2D

var target: WeakRef = null

const speed: int = 200
var target_pos: Vector2
var velocity: Vector2

func set_target(target):
	# Use WeakRef: Don't keep target object alive in memory just because of us
	self.target = weakref(target) 

func _process(delta):
	# If still alive, update the target_pos.
	# If dead, we'll still have its pos from the previous frame.
	if target.get_ref():
		target_pos = target.get_ref().get_global_transform().origin
	
	# Move an increment closer to the last known target_pos
	var vect: Vector2 = (target_pos - position)
	velocity = vect.normalized() * speed
	var increment = velocity * delta
	position += increment
	rotation = velocity.angle()
	
	# If we're within an increment, and the target has been free'd,
	# free ourselves. Otherwise, the target should free us on collision.
	if increment.length() > vect.length():
		if not target.get_ref():	
			queue_free()
