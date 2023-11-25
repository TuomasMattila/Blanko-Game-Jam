extends Node2D

const SPEED = 750
var time = 0.0

func _ready():
	Globals.kroketti_ball_moving = false

func _process(delta):
	time += delta
	if Input.is_action_just_pressed("ui_accept") and time > 1.0:
		$AudioStreamPlayer.play()
		Globals.kroketti_ball_moving = true
		$Polygon2D.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Globals.kroketti_ball_moving:
		position += transform.x * SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Game over")
	Globals.game_over = true
	queue_free()
