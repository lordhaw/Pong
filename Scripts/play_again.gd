extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(playAgain)

func playAgain():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
