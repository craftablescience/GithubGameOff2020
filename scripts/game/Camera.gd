extends Camera2D


func _ready() -> void:
	self.current = false


func _process(delta: float) -> void:
	if false:
		self.current = true
		self.position = get_parent().get_node("Game/Game/Root/Player").position
	else:
		self.position = Vector2()
		self.current = false
