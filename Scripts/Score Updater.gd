extends Label

@export var playerID:int=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(playerID==1):
		text="Red: "+ str(Global.P1_Score)
	elif(playerID==2):
		text="Blue: "+ str(Global.P2_Score)
	else:
		printerr("The playerID of ", name, " is incorrect")
		