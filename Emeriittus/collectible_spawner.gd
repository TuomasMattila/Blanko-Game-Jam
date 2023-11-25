extends Node2D

var collectible = preload("res://Emeriittus/collectible.tscn")

var spawn_time = 2.0
var cumulated_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cumulated_time += delta
	if cumulated_time > spawn_time:
		var c = collectible.instantiate()
		owner.add_child(c)
		cumulated_time = 0
		
