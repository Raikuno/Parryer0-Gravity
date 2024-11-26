extends Path2D

@export var fireball_scene: PackedScene
@export var fireballLocation: PathFollow2D
@export var timer:Timer
func _on_fireball_timer_timeout():
	var fireball = fireball_scene.instantiate()
	fireballLocation.progress_ratio = randf()
	fireball.position = fireballLocation.position
	add_sibling(fireball)
	timer.wait_time = 0.75 - (Jose_Miguel.get_speed()/4)


#func _on_player_hit():
#	print("GOLPIADO PUTO")
