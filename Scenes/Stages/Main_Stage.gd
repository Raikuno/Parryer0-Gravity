extends Node2D

var tiempo = 0;

func _physics_process(delta):
	esSoloUnTestJorgeNoMeOdiesEsMuyTardeYTengoSueño()
	
	
func esSoloUnTestJorgeNoMeOdiesEsMuyTardeYTengoSueño():
	#quiero vomitar, es lo peor que programé nunca
	var distancia = $Player.position.y - $Ground2.position.y + 31.07 
	#Iba a hacer una formula, tengo sueño y mañana trabajo, ahora es tu problema.
	if distancia < -400:
		$Player.rotation = 180 * 2 * PI / 360
	else:
		$Player.rotation = 0 * 2 * PI / 360
		


func _on_timer_timeout():  
	tiempo += 1
	print("TIEMPO: ", tiempo);
