extends Node2D

@export var assigned_player:My_Player
@export var animation_player:AnimationPlayer
@export var sprite:Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	assigned_player.hit.connect(showHit)
	assigned_player.parry.connect(showParry)

func showHit():
	sprite.set_deferred("visible", true)
	animation_player.play('Hit')

func showParry(combo : int):
	print(combo)
	sprite.set_deferred("visible", true)
	match combo:
		1:
			animation_player.play("Parry") 
		2:
			animation_player.play("Parry2") 
		3:
			animation_player.play("Parry3") 
		4:
			animation_player.play("Parry4") 
		5:
			animation_player.play("Parry5") 
		_:
			animation_player.play("Parry6") 
			

func _on_animation_player_animation_finished(anim_name):
	sprite.set_deferred("visible", false)
