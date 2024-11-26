extends Node2D


func _physics_process(delta):
	esSoloUnTestJorgeNoMeOdiesEsMuyTardeYTengoSueño()
	
func esSoloUnTestJorgeNoMeOdiesEsMuyTardeYTengoSueño():
	#quiero vomitar, es lo peor que programé nunca
	var distancia = $Player.position.y - $Ground2.position.y + 31.07 
	print(distancia)
	#Iba a hacer una formula, tengo sueño y mañana trabajo, ahora es tu problema.
	if distancia < -400:
		$Player.rotation = 180 * 2 * PI / 360
	else:
		$Player.rotation = 0 * 2 * PI / 360
		
