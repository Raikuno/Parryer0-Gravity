extends Path2D

const MAX_SPAWNS = 2
const NUMBER_OF_POSITIONS = 20.0
@onready var spawn_chance = randi_range(0, MAX_SPAWNS)
@export var fireball_scene: PackedScene
@export var fireballLocation: PathFollow2D
@export var timer:Timer
var previous_attack:int
func _on_fireball_timer_timeout():
	match(spawn_chance):
		0:
			pass
		1:
			randomMode(randi_range(0, 20))
		2:
			pattern1()
			print("pattern 1")
	previous_attack = spawn_chance
	while previous_attack == spawn_chance:
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
		generateSingleFireBall(location[i], speed[i])
		await get_tree().create_timer(time[i]).timeout

#func _on_player_hit():
#	print("GOLPIADO PUTO")

func randomMode(quantity:int):
	for i in quantity:
		var random_ratio = float(randi_range(0, NUMBER_OF_POSITIONS)/NUMBER_OF_POSITIONS) 
		timer.wait_time = 1.25 - (Jose_Miguel.get_speed()/4)
		var fireball = fireball_scene.instantiate()
		var speeds = ["SLOW", "MEDIUM", "FAST"]
		var random = randi_range(0,2)
		if(fireballLocation.progress_ratio + random_ratio > 9):
			fireballLocation.progress_ratio = 0
			random_ratio -=1
		fireballLocation.progress_ratio += random_ratio
		fireball.position = fireballLocation.position
		fireball.setSpeed(speeds[random])
		add_sibling(fireball)
		timer.wait_time = 0.75 - (Jose_Miguel.get_speed()/4)
		await get_tree().create_timer(randi_range(0, 5)).timeout

func pattern1():
	var time:Array
	var location:Array
	var quantity:int
	var speed:Array
	
	quantity = 5
	location = [1, 3, 5, 7, 9]
	time = [0.5, 0.3, 0.1, 0.1, 0.8]
	speed = ["SLOW", "FAST", "SLOW", "MEDIUM", "SLOW"]
	generateHorde(quantity, location, time, speed)
