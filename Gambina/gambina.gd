extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.value = $ProgressBar.max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value -= delta
	if $ProgressBar.value <= 0:
		Globals.game_over = true
