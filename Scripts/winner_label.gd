extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(Global.P1_Score > Global.P2_Score):
		text="Red Wins!"
	else:
		text="Blue Wins!"
		


