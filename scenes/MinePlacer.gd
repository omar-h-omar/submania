extends Node

@export var MinePrefab : PackedScene
@export var SpawnBoundsMin : Vector2
@export var SpawnBoundsMax : Vector2
@export var MinesToSpawn := 5
@export var MinDistanceBetween := 10.0

var _spawnPositions : Array
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in MinesToSpawn:
		var spawnPos = get_new_spawn_pos()
				
		
		var mine = MinePrefab.instantiate()

		mine.global_position = spawnPos
		
		_spawnPositions.push_back(spawnPos)
		
		add_child(mine)
		
		

func get_new_spawn_pos():
	var xPos = randf_range(SpawnBoundsMin.x, SpawnBoundsMax.x)
	var yPos = randf_range(SpawnBoundsMin.y, SpawnBoundsMax.y)
	var spawnPos = Vector2(xPos, yPos)
	
	for pos in _spawnPositions:
		if pos.distance_to(spawnPos) < MinDistanceBetween:
			print("re-roll")
			spawnPos = get_new_spawn_pos()
			
	return spawnPos
