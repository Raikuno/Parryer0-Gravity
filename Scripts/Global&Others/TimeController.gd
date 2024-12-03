extends Node

func speed_up():
	if (BoxFireball.get_speed() >= 2):
		queue_free()
	else: 
		BoxFireball.speed_up()
