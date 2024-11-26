extends Node2D

@export var sprite:Sprite2D
@export var timer:Timer
var backgroundGoingUp = true;

#func _physics_process(delta):
#	if backgroundGoingUp:
#		sprite.position = sprite.position - Vector2(0.5,0.1)
#	else:
#		sprite.position = sprite.position - Vector2(0.5,-0.1)

func _on_timer_timeout():
	backgroundGoingUp = !backgroundGoingUp
