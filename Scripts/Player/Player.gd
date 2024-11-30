extends CharacterBody2D
class_name My_Player

@export var state_machine:State_Machine
@export var life = 5
@export var hit_sound:AudioStreamPlayer
var jump_strength = -500.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var can_parry = true
signal hit



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
	


func damage_player(dmg_amount:int, enable_hit_stop = false, hit_stop_new_time = 1.0, hit_stop_duration = 0.0):
	hit_sound.play()
	life -= dmg_amount
	if life < 0:
	#	get_tree().quit()
		pass
	resetParry()
	if(enable_hit_stop):
		hit_stop(hit_stop_new_time, hit_stop_duration)

func hit_stop(newTime:float, duration:float):
	Engine.time_scale = newTime
	await get_tree().create_timer(duration, true, false, true).timeout
	Engine.time_scale = 1
