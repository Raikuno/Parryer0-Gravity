extends EnemyType

@export var enemy:CharacterBody2D
# Called when the node enters the scene tree for the first time. 
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hit_player(body):
	enemy.startHitAnimation()

func _on_enemy_parry(player:My_Player):
	enemy.startParryAnimation()

