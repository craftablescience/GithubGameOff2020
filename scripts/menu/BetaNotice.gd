extends AcceptDialog


export(bool) var RELEASE : bool


func _ready() -> void:
	if RELEASE:
		self.popup()
