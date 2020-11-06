extends KinematicBody2D


export(float) var SPEED: float
export(float) var SPRINT_SPEED: float
var up: bool
var down: bool
var left: bool
var right: bool
var LOOKING: String


func _ready() -> void:
	self.up = false
	self.down = false
	self.left = false
	self.right = false
	self.LOOKING = "right"

func _process(delta: float) -> void:
	self.update_input()
	# warning-ignore:return_value_discarded
	self.move_and_collide(self.get_input_direction() * delta)
	
	if Input.is_action_just_pressed("player_sprint"):
		$Halo.energy -= 0.1
		$Halo.texture_scale -= 4
	if Input.is_action_just_released("player_sprint"):
		$Halo.energy += 0.1
		$Halo.texture_scale += 4

func get_input_direction() -> Vector2:
	var motion: Vector2 = Vector2()
	if self.left:
		motion.x -= 1
	if self.right:
		motion.x += 1
	if self.up:
		motion.y -= 1
	if self.down:
		motion.y += 1
	return motion.normalized() * (SPEED + (SPRINT_SPEED if Input.is_action_pressed("player_sprint") else 1.0))

func update_input() -> void:
	if Input.is_action_just_pressed("ui_up"):
		self.up = true
		self.down = false
		self.left = false
		self.right = false
		$Halo.rotation_degrees = 270
	if Input.is_action_just_released("ui_up"):
		self.up = false
	if Input.is_action_just_pressed("ui_down"):
		self.up = false
		self.down = true
		self.left = false
		self.right = false
		$Halo.rotation_degrees = 90
	if Input.is_action_just_released("ui_down"):
		self.down = false
	if Input.is_action_just_pressed("ui_left"):
		self.up = false
		self.down = false
		self.left = true
		self.right = false
		if self.LOOKING != "left":
			self.apply_scale(Vector2(-1, 1))
			self.LOOKING = "left"
		$Halo.rotation_degrees = 0
	if Input.is_action_just_released("ui_left"):
		self.left = false
	if Input.is_action_just_pressed("ui_right"):
		self.up = false
		self.down = false
		self.left = false
		self.right = true
		if self.LOOKING != "right":
			self.apply_scale(Vector2(-1, 1))
			self.LOOKING = "right"
		$Halo.rotation_degrees = 0
	if Input.is_action_just_released("ui_right"):
		self.right = false
	
	if !(self.up or self.down or self.left or self.right):
		if Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
			self.left = true
			if self.LOOKING != "left":
				self.apply_scale(Vector2(-1, 1))
				self.LOOKING = "left"
			$Halo.rotation_degrees = 0
		if Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
			self.right = true
			if self.LOOKING != "right":
				self.apply_scale(Vector2(-1, 1))
				self.LOOKING = "right"
			$Halo.rotation_degrees = 0
		if Input.is_action_pressed("ui_up") and !Input.is_action_pressed("ui_down") and !left and !right:
			self.up = true
			$Halo.rotation_degrees = 270
		if Input.is_action_pressed("ui_down") and !Input.is_action_pressed("ui_up") and !left and !right:
			self.down = true
			$Halo.rotation_degrees = 90
