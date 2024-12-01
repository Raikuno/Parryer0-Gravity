extends Node2D

var tiempo = 0;


func _on_timer_timeout():  
	tiempo += 1
	print("TIEMPO: ", tiempo);
