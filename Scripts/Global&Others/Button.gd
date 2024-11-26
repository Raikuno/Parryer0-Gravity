extends Node2D

@export var animation_node : AnimationPlayer

func _physics_process(delta):
	if (Input.is_action_pressed("button")):
		animation_node.play("Play")
	else:
		animation_node.play("Idle")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Play" : get_tree().change_scene_to_file("res://Scenes/Stages/Main_Stage.tscn")
