extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(quit)

func quit():
	get_tree().quit()