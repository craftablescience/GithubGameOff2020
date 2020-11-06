extends Node2D


func _ready() -> void:
	$Light2D.texture_scale = 3.0
	$Light2D.energy = 1.0
	$Tween.interpolate_property($Light2D, "energy", $Light2D.energy, rand_range(0.8, 1), rand_range(0.3, 0.5), Tween.TRANS_QUAD)
	$Tween.interpolate_property($Light2D, "texture_scale", $Light2D.texture_scale, rand_range(2.8, 3.2), rand_range(0.3, 0.5), Tween.TRANS_QUAD)
	$Tween.start()

func _on_VideoPlayer_finished() -> void:
	$Panel/VideoPlayer.play()

func _on_Tween_tween_all_completed() -> void:
	$Tween.interpolate_property($Light2D, "energy", $Light2D.energy, rand_range(0.8, 1), rand_range(0.3, 0.5), Tween.TRANS_QUAD)
	$Tween.interpolate_property($Light2D, "texture_scale", $Light2D.texture_scale, rand_range(2.8, 3.2), rand_range(0.3, 0.5), Tween.TRANS_QUAD)
	$Tween.start()
