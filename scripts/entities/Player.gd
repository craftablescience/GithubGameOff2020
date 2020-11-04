extends KinematicBody2D


export(float) var SPEED: float


func _process(delta: float) -> void:
	self.move_and_slide(self.get_input() * SPEED)


# Returns the direction the player is trying to go.
func get_input() -> Vector2:
	var motion = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	
	return motion.normalized()
