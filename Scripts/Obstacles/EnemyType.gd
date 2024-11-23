extends Area2D
class_name EnemyType

signal hitPlayer(body:Node2D)
signal enemyParry

func destroy():
	queue_free()

func player_hitted(body:Node2D):
	if(body is My_Player):
		hitPlayer.emit(body)
		body.damage_player(1, true, 0.01, 0.3)
