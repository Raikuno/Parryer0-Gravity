extends Path2D

const MAX_SPAWNS = 5
const NUMBER_OF_POSITIONS = 20.0
@onready var spawn_chance = randi_range(5, MAX_SPAWNS)
@export var fireball_scene: PackedScene
@export var fireballLocation: PathFollow2D
@export var timer:Timer
@export var timerPattern:Timer
var previous_attack:int


func _on_pattern_timer_timeout():
	timerPattern.stop()
	print('EL PATRON BRRR')
	match(spawn_chance):
		0:
			timerPattern.start()
		1:
			pattern1()
			print("pattern 1")
		2:
			patternLine()
			print("pattern Line")
		3:
			patternLineInverted()
			print("pattern Line Inverted")
		4:
			patternInOneRow()
			print('pattern in one row')
		5:
			patternBox()
			print('pattern Box')
	previous_attack = spawn_chance
	while previous_attack == spawn_chance:
		spawn_chance = randi_range(0, MAX_SPAWNS)
		
func _on_fireball_timer_timeout():
	print('BOLA DE FUEGO')
	#randomMode(randi_range(0, 20))

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
		
	timerPattern.start()
	

func randomMode(quantity:int):
	for i in quantity:
		var random_ratio = float(randi_range(0, NUMBER_OF_POSITIONS)/NUMBER_OF_POSITIONS) 
		timer.wait_time = 1.25 - (Jose_Miguel.get_speed()/4)
		var fireball = fireball_scene.instantiate()
		var speeds = ["SLOW", "MEDIUM", "FAST"]
		var randomVelocity = randi_range(0,2)
		if(fireballLocation.progress_ratio + random_ratio > 9):
			fireballLocation.progress_ratio = 0
			random_ratio -=1
		fireballLocation.progress_ratio += random_ratio
		fireball.position = fireballLocation.position
		fireball.setSpeed(speeds[randomVelocity])
		add_sibling(fireball)
		timer.wait_time = 0.75 - (Jose_Miguel.get_speed()/4)
		await get_tree().create_timer(timer.get_wait_time()).timeout

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
	
func patternLine():
	var time:Array
	var location:Array
	var quantity:int
	var speed:Array
	
	quantity = 20
	location = [1, 2, 3, 4, 5, 6 , 7, 8, 9, 10,11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
	time = [0.1, 0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1, 1]
	speed = ["MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM","MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM","MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM"]
	generateHorde(quantity, location, time, speed)
	
func patternLineInverted():
	var time:Array
	var location:Array
	var quantity:int
	var speed:Array
	
	quantity = 20
	location = [20, 19, 18, 17, 16, 15 , 14, 13, 12, 11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1 ]
	time = [0.1, 0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1, 1]
	speed = ["MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM","MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM","MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM"]
	generateHorde(quantity, location, time, speed)	

func patternInOneRow():
	var time:Array
	var location:Array
	var quantity:int
	var speed:Array
	
	quantity = 20
	location = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
	time = [0.1, 0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1, 1]
	speed = ["MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM","MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM","MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM"]
	generateHorde(quantity, location, time, speed)	

func patternBox():
	var time:Array
	var location:Array
	var quantity:int
	var speed:Array
	
	quantity = 16
	location = [7,8,9,10,11,11,7,11,7,11,7,7,8,9,10,11]
	time = [0,0,0,0,0.1,0,0.1,0,0.1,0,0.1,0,0,0,0,0]
	speed = ["MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM","MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM", "MEDIUM","MEDIUM"]
	generateHorde(quantity, location, time, speed)	
