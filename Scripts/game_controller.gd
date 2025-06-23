extends Node2D

# Declare Variables
var countdownAnim: AnimationPlayer
var ball:PackedScene=load("res://Scenes/ball.tscn")
var music_player: AudioStreamPlayer
signal resetPaddle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StartGame()
	
func StartGame():
	countdownAnim=get_tree().get_first_node_in_group("countdown animation")
	var paddles=get_tree().get_nodes_in_group("paddle")
	
	for paddle in paddles:
		connect("resetPaddle",paddle.reset)
		
		
	Global.P1_Score=0
	Global.P2_Score=0
	resetPaddle.emit()
	
	#set up background music
	music_player=AudioStreamPlayer.new()
	add_child(music_player)
	var audio_stream=load("res://Sounds/lofi_background_music_by_Aenstolumin.wav")
	music_player.stream=audio_stream
	music_player.volume_db = -15
	
	#start background music
	music_player.play()
	startNextRound()
	
	
func startNextRound():
	if(Global.P1_Score==5 or Global.P2_Score==5):
		call_deferred("endGame")
		return
	countdownAnim.play("countdown")
	await countdownAnim.animation_finished
	spawnBall()
	
func endGame():
	get_tree().change_scene_to_file("res://Scenes/end_screen.tscn")
	
func spawnBall():
	var newBall=ball.instantiate()
	newBall.global_position=get_viewport().get_visible_rect().size/2
	var direction=Vector2.from_angle(randf_range(20,330))
	newBall.launch(direction)
	get_tree().root.get_child(1).add_child(newBall)
