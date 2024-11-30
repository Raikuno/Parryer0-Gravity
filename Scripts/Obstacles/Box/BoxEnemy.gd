extends EnemyType
# Called when the node enters the scene tree for the first time.
@export var assigned_enemy:CharacterBody2D

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_parry(player:My_Player):
	assigned_enemy.queue_free()
	pass # Replace with function body.


func _on_hit_player(body):
	assigned_enemy.queue_free()
