extends Node2D

const MAX_SPAWNS = 10
@onready var spawn_chance = randi_range(0, MAX_SPAWNS)
@export var box_enemy:PackedScene
@export var invert_gravity:bool
@export var timer:Timer
# Called when the node enters the scene tree for the first time.

func _on_timer_timeout():
	timer.wait_time = 1.25 - (Jose_Miguel.get_speed()/4)
	match(spawn_chance):
		0,1,2,3:
			pass
		4,5,6,7,8,9:
			generateSingleBox()
		10:
			generateBoxRow()
			timer.wait_time = 5 - (Jose_Miguel.get_speed()/4)
	spawn_chance = randi_range(0, MAX_SPAWNS)


func generateSingleBox():
	var box_instance = box_enemy.instantiate()
	if(box_instance.has_method("invert_gravity")):
		box_instance.invert_gravity(invert_gravity)
	box_instance.position = position
	add_sibling(box_instance)
	
func generateBoxRow():	
	for i in range(0, 10):
		generateSingleBox()
		await get_tree().create_timer(0.2).timeout
