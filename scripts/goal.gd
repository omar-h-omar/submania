extends Area2D

func _on_body_entered(body):
	LevelManager.next_level()
