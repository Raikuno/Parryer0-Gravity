extends CharacterBody2D

@export var base_velocity_min = 1
@export var base_velocity_max = 5

func _ready():
	velocity = Vector2(randf_range(base_velocity_min, base_velocity_max), 0.0);
	
func _physics_process(delta):
	print(position.x)
	position.x = position.x - velocity.x
	move_and_slide()
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
