extends EnemyType

@export var base_velocity_min = 100
@export var base_velocity_max = 500
@export var animation_node : AnimationPlayer
@export var sprite : Sprite2D
@export var hitbox_node : CollisionShape2D
#La velocidad esta completa y absolutamente poseida. Esta esta bautizada y bendecida, no deberia dar problemas
var object_speed:float

func _ready():
	var randomScale = randf_range(1.5,3)
	scale = Vector2(randomScale,randomScale)
	
	#velocity = Vector2(randf_range(base_velocity_min, base_velocity_max), 0.0);
	object_speed = randf_range(base_velocity_min, base_velocity_max)
	
func _physics_process(delta):
	position.x = position.x - (object_speed * delta)



func _on_hit_player(body:Node2D):
	var opposite_position = global_position - (body.global_position - global_position)
	object_speed = 0 
	hitbox_node.set_deferred("disabled",true)
	animation_node.play("explotion_parry")
	sprite.look_at(opposite_position)

	

func _on_animation_player_animation_finished(anim_name : String):
	if anim_name == "explotion" or anim_name == "explotion_parry":
		destroy()
