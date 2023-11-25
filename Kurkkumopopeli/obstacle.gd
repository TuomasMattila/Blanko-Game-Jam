extends Area2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var width = rng.randf_range(1.0, 6.0)
	var height = rng.randf_range(1.0, 5.0)
	apply_scale(Vector2(width, height))
	$AnimationPlayer.play("move_left")
	$AnimationPlayer.speed_scale = Globals.obstacle_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $AnimationPlayer.is_playing():
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("player"):
		Globals.game_over = true
		body.queue_free()
