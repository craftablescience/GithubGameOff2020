extends Node2D
class_name Item, "res://images/editor/Item.png"


var TYPE: int


func _ready() -> void:
	TYPE = TYPES.EMPTY

func get_type() -> int:
	return TYPE

func set_typw(type: int) -> void:
	self.TYPE = type
