extends Area2D

#declare variables
@export var GoalID :int=0
var score_audio: AudioStreamPlayer

func _ready():
	body_entered.connect(scored)
	score_audio=AudioStreamPlayer.new()
	add_child(score_audio)
	var audio_stream=load("res://Sounds/Score.wav")
	score_audio.stream=audio_stream

func scored(body):
	if(body.is_in_group("ball")):
		if(GoalID==1):
			Global.P2_Score +=1
			score_audio.play()
			#print(Global.P2_Score)
		elif(GoalID==2):
			Global.P1_Score +=1
			score_audio.play()
			#print(Global.P1_Score)
	body.queue_free()
	owner.startNextRound()