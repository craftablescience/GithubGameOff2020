extends Control


signal new_game


func _on_ContextPanel_new_game() -> void:
	self.emit_signal("new_game")

func _on_Fullscreen_toggled(button_pressed: bool) -> void:
	OS.window_fullscreen = button_pressed
