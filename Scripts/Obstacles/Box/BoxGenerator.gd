extends Node2D

const MAX_SPAWNS = 1 
@onready var spawn_chance = randi_range(0, MAX_SPAWNS)
@export var box_enemy:PackedScene
@export var invert_gravity:bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	match(spawn_chance):
		0:
			pass
		1:
			generateSingleBox()
	spawn_chance = randi_range(0, MAX_SPAWNS)
	print(spawn_chance)

func generateSingleBox():
	var box_instance = box_enemy.instantiate()
	if(box_instance.has_method("invert_gravity")):
		box_instance.invert_gravity(invert_gravity)
	box_instance.position = position
	add_sibling(box_instance)
