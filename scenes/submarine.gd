extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	var vertical_direction = Input.get_axis("up", "down")
	if vertical_direction:
		velocity.y = vertical_direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	var horizontal_direction = Input.get_axis("left", "right")
	if horizontal_direction:
		velocity.x = horizontal_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
