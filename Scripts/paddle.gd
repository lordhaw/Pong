extends CharacterBody2D

#Declare Variables
@export var paddleID: int=1
@export var cpuPaddle: bool=false
var speed: int=10
@onready var paddleSprite :Sprite2D=$Sprite2D



# When the paddle is loaded into the game, on the main scene starting, this code will run
func _ready() -> void:
	
		
	if(paddleID==1):
		paddleSprite.texture=load("res://Sprites/Paddle 1.png")
	elif(paddleID==2):
		paddleSprite.texture=load("res://Sprites/Paddle 2.png")
	else:
		printerr("The paddleID has been assigned to something other than 1 or 2")
	
# The process function runs every frame the game runs, many times a second
func _process(delta: float) -> void:
	if(Global.CPU_Player==true && paddleID==2):
		cpuPlayer(delta)
		
	if(Input.is_action_pressed("Up_"+str(paddleID))):
		global_position.y -=speed
		
	if(Input.is_action_pressed("Down_"+str(paddleID))):
		global_position.y +=speed
	
			
	global_position.y=clamp(global_position.y,80,get_viewport_rect().size.y -80)
	
func reset():
	global_position.y=get_viewport_rect().size.y/2
	
func cpuPlayer(delta):
	if(Global.Ball_Pos > global_position.y):
		global_position.y =lerp(global_position.y, global_position.y + speed, 3*speed*delta)
	elif(Global.Ball_Pos < global_position.y):
		global_position.y =lerp(global_position.y, global_position.y - speed, 3*speed*delta)


