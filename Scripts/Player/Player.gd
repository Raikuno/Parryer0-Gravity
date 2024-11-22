extends CharacterBody2D
class_name My_Player

@export var state_machine:State_Machine
var jump_strength = -1000.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var can_parry = true

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

func resetParry():
	can_parry = true

func disableParry():
	can_parry = false

func invertGravity():
	gravity *= -1
	velocity.y += jump_strength
	jump_strength *= -1
