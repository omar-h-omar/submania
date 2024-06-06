extends CharacterBody2D

const SPEED = 300.0
@onready var mines_nearby_label = $MinesNearbyLabel
@onready var mine_player = $MinePlayer

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
	
func on_level_start():
	pass
	#_mines = get_tree().get_nodes_in_group("mines")
	
	#for mine in _mines:
		#mine.


# Mine Detector
func _on_area_2d_area_entered(area):
	# Mine area
	_nearMineCount += 1
	mines_nearby_label.text = str(_nearMineCount)
	mine_player.play()


func _on_area_2d_area_exited(area):
	_nearMineCount -= 1
	mines_nearby_label.text = str(_nearMineCount)

# Mine Collision
func _mine_collision(body):
	%GameOverOverlay.visible = true
	$AudioStreamPlayer2D.play()
	LevelManager.gameover()
