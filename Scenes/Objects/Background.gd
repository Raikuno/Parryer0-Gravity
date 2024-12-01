extends Node2D

@export var sprite:Sprite2D
@export var timer:Timer
var backgroundGoingUp = true;
@export var backgroundVelocity = 0.5

func _physics_process(delta):
	if sprite.position.x < -500:
		sprite.position = Vector2(500,sprite.position.y)
	if backgroundGoingUp:
		sprite.position = sprite.position - Vector2(backgroundVelocity,0.1)
	else:
		sprite.position = sprite.position - Vector2(backgroundVelocity,-0.1)

func _on_timer_timeout():
	backgroundGoingUp = !backgroundGoingUp
