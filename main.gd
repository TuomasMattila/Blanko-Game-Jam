extends Node2D

var rng = RandomNumberGenerator.new()
var emeriittuspeli = preload("res://Emeriittus/emeriittuspeli.tscn")
var kroketti = preload("res://Kroketti/kroketti.tscn")
var kurkkumopopeli = preload("res://Kurkkumopopeli/kurkkumopopeli.tscn")
var game_modes = [emeriittuspeli, kroketti, kurkkumopopeli]
var current_mode = 0
var next_mode = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_mode = rng.randi_range(0, 2)
	var game_mode = game_modes[current_mode].instantiate()
	get_child(0).get_child(0).replace_by(game_mode)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if Globals.game_over:
		BackgroundMusic.stop()
		get_child(0).get_tree().paused = true
		$CanvasLayer/GameOverLabel.visible = true
		
	if Globals.game_over and Input.is_action_just_pressed("ui_accept"):
		BackgroundMusic.play()
		get_child(0).get_tree().paused = false
		reset_variables()
		$CanvasLayer/GameOverLabel.visible = false
		get_tree().reload_current_scene()
	
	# Emeriittuspeli win
	if Globals.collebtibles_collected == 5:
		Globals.collebtibles_collected = 0
		next_game()
		
	# Kroketti win
	if Globals.kroketti_success:
		Globals.kroketti_success = false
		next_game()
		
	# Kurkkumopopeli win
	if Globals.kurkkumopopeli_obstacles >= 6:
		Globals.kurkkumopopeli_obstacles = 0
		next_game()

func reset_variables():
	Globals.score = 0
	Globals.game_over = false
	Globals.kroketti_success = false
	Globals.collebtibles_collected = 0
	Globals.kurkkumopopeli_obstacles = 0
	Globals.rotation_speed_multiplier = 1.0
	Globals.obstacle_speed = 1.0
	Globals.collectible_speed = 350.0

func next_game():
	update_score()
	get_child(0).get_tree().paused = true
	$CanvasLayer/SuccessLabel.visible = true
	$AudioStreamPlayer.play()
	await $AudioStreamPlayer.finished
	next_mode = current_mode
	while next_mode == current_mode:
		next_mode = rng.randi_range(0, 2)
	var game_mode = game_modes[next_mode].instantiate()
	get_child(0).get_tree().paused = false
	$CanvasLayer/SuccessLabel.visible = false
	get_child(0).get_child(0).queue_free()
	get_child(0).add_child(game_mode)
	current_mode = next_mode
	
func update_score():
	Globals.score += 1
	Globals.obstacle_speed += 0.1
	Globals.collectible_speed += 50.0
	Globals.rotation_speed_multiplier += 0.3
	$CanvasLayer/ScoreLabel.text = "Score: " + str(Globals.score)
	
