extends Node

@export var music_node:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	var bgm_node = music_node.instantiate()
	add_sibling(bgm_node)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
