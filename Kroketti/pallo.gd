extends Node2D

const SPEED = 750

func _ready():
	Globals.kroketti_ball_moving = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$AudioStreamPlayer.play()
		Globals.kroketti_ball_moving = true
		$Polygon2D.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Globals.kroketti_ball_moving:
		position += transform.x * SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	Globals.game_over = true
	queue_free()
