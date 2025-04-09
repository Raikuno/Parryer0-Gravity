extends Node
class_name BoxFireballMultiplier

static var global_speed = 1


static func get_speed():
	return global_speed

static func speed_up():
	global_speed +=0.005

static func reset_speed():
	global_speed = 1
