extends KinematicBody2D

const ACCELERATION = 550
const MAX_SPEED = 150
const FRICTION = 850

var velocity = Vector2.ZERO

func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		if (Input.get_action_strength("ui_shift")):
			velocity = velocity.move_toward(input_vector * (MAX_SPEED + 500), ACCELERATION * delta)
		elif (Input.get_action_strength("ui_ctrl")):
			velocity = velocity.move_toward(input_vector * (MAX_SPEED - 100), ACCELERATION * delta)
		else:
			velocity = velocity.move_toward(input_vector * (MAX_SPEED), ACCELERATION * delta)
			
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
