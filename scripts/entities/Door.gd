extends Node2D


var OPEN: bool
var INPUT_READY: bool


func _ready() -> void:
	$Door.play("closing")
	self.OPEN = true
	self.INPUT_READY = false

func _process(_delta: float) -> void:
	$StaticBody2D/CollisionShape2D.disabled = self.OPEN
	
	if self.INPUT_READY and Input.is_action_just_pressed("ui_select"):
		if self.OPEN:
			$Door.play("closing")
			$LightOccluder2D.show()
		else:
			$Door.play("opening")
			$LightOccluder2D.hide()


func _on_Door_animation_finished() -> void:
	self.OPEN = !self.OPEN

func _on_Area2D_body_entered(body: Node) -> void:
	self.INPUT_READY = true

func _on_Area2D_body_exited(body: Node) -> void:
	self.INPUT_READY = false
