extends CharacterBody2D
class_name My_Player

@export var state_machine:State_Machine
@export var life = 4
@export var hit_sound:AudioStreamPlayer
@export var animation_player:AnimationPlayer
@export var death_particle:PackedScene
var jump_strength = -500.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var can_parry = true
var BLUE = 'BLUE'
var RED = 'RED'
var playerColor = BLUE
signal hit
signal parry
signal death


func changeGroundAnimation():
	if playerColor == BLUE:
		animation_player.play('Ground')
	else:
		animation_player.play('Ground_Red')
		
func changeAirAnimation():
	if playerColor == BLUE:
		animation_player.play('Air')
	else:
		animation_player.play('Air_Red')
		
func changeParryAnimation():
	if playerColor == BLUE:
		animation_player.play('Parry')
	else:
		animation_player.play('Parry_Red')

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	if(Input.is_action_just_pressed("debug")):
		print(is_on_floor())
		print(is_on_ceiling())

func resetParry():
	can_parry = true

func disableParry():
	can_parry = false

func invertGravity():
	velocity.y = 0
	gravity *= -1
	velocity.y += jump_strength
	jump_strength *= -1
	if playerColor == BLUE:
		rotation = PI
		playerColor = RED
	else:
		rotation = 0  
		playerColor = BLUE		
	

func parry_succeded():
	parry.emit()

func damage_player(dmg_amount:int, enable_hit_stop = false, hit_stop_new_time = 1.0, hit_stop_duration = 0.0):
	hit_sound.play()
	life -= dmg_amount
	if life <= 0:
		death.emit()
		kill_player()
	else:
		hit.emit()
	resetParry()
	if(enable_hit_stop):
		hit_stop(hit_stop_new_time, hit_stop_duration)

func hit_stop(newTime:float, duration:float):
	Engine.time_scale = newTime
	await get_tree().create_timer(duration, true, false, true).timeout
	Engine.time_scale = 1

func kill_player():
	var particle = death_particle.instantiate()
	if particle.has_method("show_death"):
		particle.show_death(playerColor, velocity.y)
		particle.set_deferred("position",position)
		add_sibling(particle)
	set_deferred("visible", false)
	set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	
func get_lives() -> int:
	return life
