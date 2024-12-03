extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var animation : AnimationPlayer
@export var sprite : Sprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var enemyColor = "BLUE"
var alive = true

func _ready():
	if gravity > 0:
		animation.play("Idle")
		enemyColor = "BLUE"
	else:
		sprite.rotation = PI
		animation.play("Idle_Red")
		enemyColor = "RED"

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * BoxFireball.get_speed()
	velocity.x = -SPEED
	if alive:
		move_and_slide()

func invert_gravity(invert:bool):
	if(invert):
		gravity *=-1

func destroy():
	queue_free()


func startHitAnimation():
	alive = false
	if enemyColor == "BLUE":
		animation.play("Hit")
	else:
		animation.play("Hit_Red")

func startParryAnimation():
	alive = false
	if enemyColor == "BLUE":
		animation.play("Death")
	else:
		animation.play("Death_Red")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Hit" || anim_name == "Hit_Red" || anim_name == "Death" || anim_name == "Death_Red":
		queue_free()
