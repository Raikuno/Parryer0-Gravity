extends CharacterBody2D
class_name My_Player

@export var state_machine:State_Machine
@export var lifeIsNot4 = 5
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
	gravity *= -1
	velocity.y += jump_strength
	jump_strength *= -1

func _on_area_2d_area_entered(area):
	print(state_machine.current_state.name)
	if state_machine.current_state.name == "Parry": #Jorge te encargo hacer esto de forma menos guarra, esto es solo una prueba de concepto
		print("LO PARREASTE PERRO")
	else:
		lifeIsNot4 = lifeIsNot4 - 1
		print(lifeIsNot4)
		hit.emit()
