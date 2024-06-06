extends CharacterBody2D

const SPEED = 300.0
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	
	if Input.is_action_just_pressed("left"):
		animated_sprite_2d.rotation_degrees = 90
	elif Input.is_action_just_pressed("right"):
		animated_sprite_2d.rotation_degrees = -90
	elif Input.is_action_just_pressed("down"):
		animated_sprite_2d.rotation_degrees = 0
	elif Input.is_action_just_pressed("up"):
		animated_sprite_2d.rotation_degrees = 180
		
	move_and_slide()

func _mine_detected(body):
	print("Mine Nearby!")
	pass # Replace with function body.
