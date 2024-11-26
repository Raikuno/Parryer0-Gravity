extends EnemyType

const MIN_SCALE = 1.5
const MAX_SCALE = 3
@export var base_velocity_min = 300
@export var base_velocity_max = 500
@export var animation_node : AnimationPlayer
@export var sprite : Sprite2D
@export var hitbox_node : CollisionShape2D
#La velocidad esta completa y absolutamente poseida. Esta esta bautizada y bendecida, no deberia dar problemas
var object_speed:float
var y_speed:float
func _ready():
	var randomScale = randf_range(MIN_SCALE, MAX_SCALE)
	scale = Vector2(randomScale, randomScale)
	
	#velocity = Vector2(randf_range(base_velocity_min, base_velocity_max), 0.0);
	object_speed = randf_range(base_velocity_min, base_velocity_max)
	
func _physics_process(delta):
	position.x -= object_speed * delta * Jose_Miguel.get_speed()
	position.y -= y_speed * delta * Jose_Miguel.get_speed()



func _on_hit_player(body:Node2D):
	object_speed = 0 
	hitbox_node.set_deferred("disabled",true)
	animation_node.play("explotion")



func _on_animation_player_animation_finished(anim_name : String):
	if anim_name == "explotion" or anim_name == "explotion_parry":
		destroy()

# Esto esta hecho un poco para testear, son las 4:30 de la mañana, me duele la cabeza y tengo 0 motivo para no dejar esto para mañana
# Veo bien conservar la mecánica que metí que detecte donde está el jugador y la bala explote en esa dirección, no veo motivo para no dejarla, luego lo hablamos.
func _on_enemy_parry(player:My_Player):
	#var opposite_position = global_position - (body.global_position - global_position)
	var random = randf_range(-1.0,1.0)
	#object_speed = 0 
	y_speed = random * -object_speed
	object_speed *= -1
	scale.x *= -1
	rotate(random)
	await get_tree().create_timer(0.4).timeout
	hitbox_node.set_deferred("disabled",true)
	animation_node.play("explotion_parry")
	object_speed = 0
	y_speed = 0
	#sprite.look_at(opposite_position)

