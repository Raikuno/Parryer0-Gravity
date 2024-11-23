extends Path2D

@export var fireball_scene: PackedScene
@export var fireballLocation: PathFollow2D
func _on_fireball_timer_timeout():
	var fireball = fireball_scene.instantiate()
	fireballLocation.progress_ratio = randf()
	fireball.position = fireballLocation.position
	add_sibling(fireball)


#func _on_player_hit():
#	print("GOLPIADO PUTO")
