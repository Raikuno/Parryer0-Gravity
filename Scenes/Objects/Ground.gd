extends StaticBody2D

@export var sprite:Sprite2D
@export var backgroundVelocity = 0.3

func _physics_process(delta):
	sprite.position.x = sprite.position.x - backgroundVelocity
