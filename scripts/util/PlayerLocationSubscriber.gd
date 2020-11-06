extends Node2D


var player_pos: Vector2


func _ready() -> void:
	self.add_to_group("PlayerLocationSubscriber", true)
	self.player_pos = Vector2()

func set_player_pos(pos: Vector2) -> void:
	self.player_pos = pos
