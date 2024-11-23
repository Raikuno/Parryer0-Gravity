extends CharacterBody2D

@export var base_velocity_min = 1
@export var base_velocity_max = 5

func _ready():
	var randomScale = randf_range(1.5,3)
	scale = Vector2(randomScale,randomScale)
	velocity = Vector2(randf_range(base_velocity_min, base_velocity_max), 0.0);
	
func _physics_process(delta):
	position.x = position.x - velocity.x
	move_and_slide()
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_area_entered(area):
	queue_free()
