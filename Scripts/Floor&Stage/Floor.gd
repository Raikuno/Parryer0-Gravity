extends Node2D

@export var assigned_player:My_Player
@export var animation_player:AnimationPlayer
var names = ["3_out", "3_out", "2_out", "1_out"]
# Called when the node enters the scene tree for the first time.
func _ready():
	assigned_player.hit.connect(change_live)


func change_live():
	animation_player.play(names[assigned_player.get_lives()])
