extends Button

func _ready() -> void:
	pressed.connect(startGame)

func startGame():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	Global.CPU_Player=true
	

	
