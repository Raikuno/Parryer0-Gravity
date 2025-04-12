extends Area2D

@export var animation_node : AnimationPlayer
@export var collision : CollisionShape2D

func _input(event: InputEvent) -> void:
	#El tamaño que se debe restar para obtener las esquinas es la mitad del tamaño total, pues el recorrido ha hacer es la mitad al de la longitud total
	var collisionSize : Vector2= collision.shape.size/2
	var upperLeftVertex : Vector2 = collision.global_position - collisionSize
	var bottomRightVertex : Vector2 = collision.global_position + collisionSize
	if event is InputEventMouseButton:
		if (event.is_pressed() && (event.global_position.x > upperLeftVertex.x) && (event.global_position.y > upperLeftVertex.y) && (event.global_position.x < bottomRightVertex.x)&& (event.global_position.y < bottomRightVertex.y)):
			animation_node.play("Play (2)")
		if(event.is_released()):
			if(animation_node.current_animation == "Play (2)" && (event.global_position.x > upperLeftVertex.x) && (event.global_position.y > upperLeftVertex.y) && (event.global_position.x < bottomRightVertex.x)&& (event.global_position.y < bottomRightVertex.y)):
				get_tree().change_scene_to_file("res://Scenes/Stages/Main_Stage.tscn")
			animation_node.play("Idle")
func _physics_process(delta):
	"""
	if (Input.is_action_pressed("button")):
		animation_node.play("Play (2)")
	
	if(Input.is_action_just_released("button")):
		get_tree().change_scene_to_file("res://Scenes/Stages/Main_Stage.tscn")
	"""
	

"""
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Play" : get_tree().change_scene_to_file("res://Scenes/Stages/Main_Stage.tscn")
"""
