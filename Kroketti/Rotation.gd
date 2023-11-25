extends Node2D

var max_angle = 1.5
var time = 0.0
var rotate = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if Globals.kroketti_ball_moving == false:
		time += delta
		rotation = sin(time * Globals.rotation_speed_multiplier) * max_angle
