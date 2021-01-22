extends Node2D
class_name Item, "res://images/editor/Item.png"


var TYPE: int


func _ready() -> void:
	TYPE = Globals.TYPES.NONE

func get_type() -> int:
	return TYPE

func set_type(type: int) -> void:
	self.TYPE = type

func _on_use():
	pass

func _on_secondary_use():
	pass
