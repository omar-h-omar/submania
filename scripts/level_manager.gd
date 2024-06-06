extends Node

var current_scene = null
var allow_restart = false

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func next_level():
	if current_scene != null:
		current_scene.free()
	var nextLevel = ResourceLoader.load("res://scenes/game.tscn")
	current_scene = nextLevel.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	
func gameover():
	allow_restart = true
	
func _physics_process(delta):
	if Input.is_action_just_pressed("restart") && allow_restart:
		allow_restart = false
		next_level()

