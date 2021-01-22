extends Node2D


var MainMenu: Control
var Game: Node2D


func _ready() -> void:
	MainMenu = $Menu/MainMenu
	Game = $Game
	MainMenu.show()
	MainMenu.modulate.a = 1
	Game.show()
	$PlayerCamera.current = false
	get_tree().paused = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		MainMenu.show()
		get_tree().paused = true


func _on_MainMenu_new_game() -> void:
	MainMenu.hide()
	$PlayerCamera.current = true
	get_tree().paused = false

func _on_BackgroundMusic_finished() -> void:
	$BackgroundMusic.play()
