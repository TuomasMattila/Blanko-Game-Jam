extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jump_cooldown = 0.2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	jump_cooldown -= delta
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and jump_cooldown <= 0:
		velocity.y = JUMP_VELOCITY
		rotation = -1.0
		jump_cooldown = 0.2
		
	rotate(0.02)

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Game over")
	Globals.game_over = true
	queue_free()
