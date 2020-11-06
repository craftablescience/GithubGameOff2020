extends Camera2D


func _ready() -> void:
	self.position = get_parent().get_node("Game/Player").position

func _process(_delta: float) -> void:
	self.position = get_parent().get_node("Game/Player").position
