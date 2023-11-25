extends CharacterBody2D

func _physics_process(delta):
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and not Globals.gambina_success:
		rotate(-0.2)
		
	if rotation <= -2.5:
		Globals.gambina_success = true
	
	if not Globals.gambina_success and rotation < 0.0:
		rotate(Globals.gambina_difficulty)

	move_and_slide()
