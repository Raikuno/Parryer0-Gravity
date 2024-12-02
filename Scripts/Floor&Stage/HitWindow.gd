extends Node2D

@export var assigned_player:My_Player
@export var animation_player:AnimationPlayer
@export var sprite:Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	assigned_player.hit.connect(showHit)
	assigned_player.parry.connect(showParry)

func showHit():
	sprite.visible = true
	animation_player.play('Hit')

func showParry():
	sprite.visible = true
	animation_player.play('Parry')

func _on_animation_player_animation_finished(anim_name):
	sprite.visible = false
