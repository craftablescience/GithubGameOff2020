extends Control


signal new_game


func _on_ContextPanel_new_game() -> void:
	self.emit_signal("new_game")
