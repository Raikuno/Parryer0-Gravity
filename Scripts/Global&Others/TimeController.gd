extends Node

@export var timer:Timer

func speed_up():
	if (Jose_Miguel.get_speed() >= 2):
		queue_free()
	else: 
		Jose_Miguel.speed_up()
