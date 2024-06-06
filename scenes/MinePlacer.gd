extends Node

@export var MinePrefab : PackedScene
@export var SpawnBoundsMin : Vector2
@export var SpawnBoundsMax : Vector2
@export var MinesToSpawn := 5
@export var MinDistanceBetween := 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in MinesToSpawn:
		var xPos = randf_range(SpawnBoundsMin.x, SpawnBoundsMax.x)
		var yPos = randf_range(SpawnBoundsMin.y, SpawnBoundsMax.y)
		
		var mine = MinePrefab.instantiate()
		mine.global_position = Vector2(xPos, yPos)
		
		add_child(mine)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
