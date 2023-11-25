extends Node2D

var score = 0
var game_over = false

var kroketti_success = false
var collebtibles_collected = 0
var kurkkumopopeli_obstacles = 0

var rotation_speed_multiplier = 1.0
var obstacle_speed = 1.0
var collectible_speed = 350.0

var haalari_merkit = [
	preload("res://Assets/kurkkumopomerkki.webp"),
	preload("res://Assets/Ball.png")
]
