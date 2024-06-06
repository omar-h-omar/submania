extends CharacterBody2D

const SPEED = 300.0

var _nearMineCount := 0

func _ready():
	on_level_start()

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

func _mine_detected(body):
	print("Mine Nearby!")
	pass # Replace with function body.
	
func on_level_start():
	pass
	#_mines = get_tree().get_nodes_in_group("mines")
	
	#for mine in _mines:
		#mine.


func _on_area_2d_area_entered(area):
	# Mine area
	_nearMineCount += 1
	
