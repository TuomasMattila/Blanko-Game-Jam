extends Node2D

const SPEED = 750
var moving = false
var time = 0.0
	
func _process(delta):
	time += delta
	if Input.is_action_just_pressed("ui_accept") and time > 1.0:
		moving = true
		$Polygon2D.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if moving:
		position += transform.x * SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Game over")
	Globals.game_over = true
	queue_free()
