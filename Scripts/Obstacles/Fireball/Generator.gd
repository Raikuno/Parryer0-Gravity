extends Path2D

const MAX_SPAWNS = 2
const NUMBER_OF_POSITIONS = 20.0
@onready var spawn_chance = randi_range(0, MAX_SPAWNS)
@export var fireball_scene: PackedScene
@export var fireballLocation: PathFollow2D
@export var timer:Timer
func _on_fireball_timer_timeout():
	match(spawn_chance):
		0:
			pass
		1:
			randomMode()
		2:
			pattern1()
			print("pattern 1")
	spawn_chance = randi_range(0, MAX_SPAWNS)

func generateSingleFireBall(progress:int, speed:String):
	var fireball = fireball_scene.instantiate()
	fireballLocation.progress_ratio = float(progress / NUMBER_OF_POSITIONS)
	fireball.position = fireballLocation.position
	fireball.setSpeed(speed)
	add_sibling(fireball)

func generateHorde(quantity:int, location:Array, time:Array, speed:Array):

	if !(location.size() == quantity) || !(time.size() == quantity):
		print("formato incorrecto de posicion/tiempo")
		return
	for i in range(0, quantity):
		await get_tree().create_timer(time[i]).timeout
		generateSingleFireBall(location[i], speed[i])

#func _on_player_hit():
#	print("GOLPIADO PUTO")

func randomMode():
	timer.wait_time = 1.25 - (Jose_Miguel.get_speed()/4)
	var fireball = fireball_scene.instantiate()
	fireballLocation.progress_ratio = float(randi_range(0, NUMBER_OF_POSITIONS)/NUMBER_OF_POSITIONS)
	fireball.position = fireballLocation.position
	add_sibling(fireball)
	timer.wait_time = 0.75 - (Jose_Miguel.get_speed()/4)

func pattern1():
	var time:Array
	var location:Array
	var quantity:int
	var speed:Array
	
	quantity = 5
	location = [1, 2, 3, 4, 5]
	time = [0, 0.1, 0.1, 0.1, 0.1]
	speed = ["SLOW", "FAST", "SLOW", "MEDIUM", "SLOW"]
	generateHorde(quantity, location, time, speed)
