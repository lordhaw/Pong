extends CharacterBody2D

#Declare Variables
var speed:int=500
var ball_audio: AudioStreamPlayer
@export var ball: CharacterBody2D

# Code runs when ball loaded into game
func launch(direction:Vector2):
	velocity=direction*speed
	ball_audio=AudioStreamPlayer.new()
	add_child(ball_audio)
	var audio_stream=load("res://Sounds/ballbounce.wav")
	ball_audio.stream=audio_stream

# The process function runs every frame the game runs, many times a second
func _process(delta: float) -> void:
	Global.Ball_Pos=global_position.y
	var collision=move_and_collide(velocity*delta)
	if(collision):
		ball_audio.play()
		velocity=velocity.bounce(collision.get_normal())*1.01
		
		
	
