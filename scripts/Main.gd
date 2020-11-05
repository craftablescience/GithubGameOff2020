extends Node2D


func _ready() -> void:
	$Game/UI/UI.hide()
	$Game/Game/Root.hide()
	$Menu/MainMenu.show()
	get_tree().paused = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		$Game/UI/UI.hide()
		$Game/Game/Root.hide()
		$Menu/MainMenu.show()
		get_tree().paused = true

func _on_MainMenu_new_game() -> void:
	$Menu/MainMenu.hide()
	$Game/Game/Root.show()
	$Game/UI/UI.show()
	get_tree().paused = false
