extends Area2D

var rng = RandomNumberGenerator.new()

var speed = 350.0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = rng.randf_range(96.0, 544.0)
	get_node("Sprites").get_child(rng.randi_range(0, 5)).visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		position.x -= Globals.collectible_speed * delta
		
		if position.x <= -160.0:
			print("Game over")
			Globals.game_over = true
			queue_free()

func _on_body_entered(body):
	visible = false
	position.x = 2000.0
	$AudioStreamPlayer.play()
	Globals.collebtibles_collected += 1
