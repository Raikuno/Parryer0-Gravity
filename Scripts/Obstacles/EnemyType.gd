extends Area2D
class_name EnemyType
#Con esta variable se evita que una bala a la que se le ha hecho parry, colisione con el player
@onready var being_parried = false
signal hitPlayer(body:Node2D)
signal enemyParry

func destroy():
	queue_free()

func parried():
	being_parried = true
	enemyParry.emit()

func player_hitted(body:Node2D):
	if(body is My_Player && !being_parried):
		hitPlayer.emit(body)
		body.damage_player(1, true, 0.01, 0.3)
