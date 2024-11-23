extends Node2D

@export var fireball_scene: PackedScene

func _on_fireball_timer_timeout():
	var fireball = fireball_scene.instantiate()

	var fireballLocation = $FireballSpawn/FireballSpawner
	fireballLocation.progress_ratio = randf()
	fireball.position = fireballLocation.position
	add_child(fireball)


func _on_player_hit():
	print("GOLPIADO PUTO")
