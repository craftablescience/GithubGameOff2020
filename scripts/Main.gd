extends Node2D


func _ready() -> void:
	$Game/UI/UI.hide()
	$Game/Game/Root.hide()
	get_tree().paused = true
