extends Node2D

@export var animation_node : AnimationPlayer

func _physics_process(delta):
	if (Input.is_action_pressed("button")):
		animation_node.play("Play")
	else:
		animation_node.play("Idle")
