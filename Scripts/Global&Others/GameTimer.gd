extends Node2D

@export var label:Label
@export var assigned_player:My_Player
@export var timer:Timer
var tiempo = 0;
func _ready():
	assigned_player.death.connect(stop_time_count)

func _on_timer_timeout():  
	var minutes:int = 0
	var seconds:int = 0
	var minutesString:String
	var secondsString:String
	var timer_value:String
	tiempo += 1
	if (tiempo/60 > 0):
		seconds = tiempo%60
		minutes = tiempo/60
	else:
		seconds = tiempo
		minutes = 0
	secondsString = "%02d" % seconds
	minutesString = "%02d" % minutes
	timer_value = "%s" % minutesString
	timer_value += ":"
	timer_value += "%s" % secondsString
	label.set_deferred("text", timer_value)
	print("TIEMPO: ", tiempo);

func stop_time_count():
	timer.stop()
