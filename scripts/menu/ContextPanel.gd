extends TabContainer


signal new_game


func _ready() -> void:
	pass


func _on_Play_pressed() -> void:
	self.current_tab = 1

func _on_Settings_pressed() -> void:
	self.current_tab = 2

func _on_Quit_pressed() -> void:
	self.current_tab = 3

func _on_QuitForReal_pressed() -> void:
	get_tree().quit(0)

func _on_NewGame_pressed() -> void:
	self.emit_signal("new_game")
