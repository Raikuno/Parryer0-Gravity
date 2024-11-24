extends Area2D
class_name EnemyType
#Con esta variable se evita que una bala a la que se le ha hecho parry, colisione con el player
@onready var being_parried = false
@export var atq_strength = 1
@export var bounce = false
signal hitPlayer(body:Node2D)
signal enemyParry(player:My_Player)

func destroy():
	queue_free()

func parried(player:My_Player):
	if(!being_parried):
		being_parried = true
		enemyParry.emit(player)

func player_hitted(body:Node2D):
	if(body is My_Player && !being_parried):
		hitPlayer.emit(body)
		body.damage_player(atq_strength, true, 0.01, 0.3)

func can_bounce() -> bool:
	return bounce
