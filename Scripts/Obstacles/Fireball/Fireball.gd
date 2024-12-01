extends EnemyType

const MIN_SCALE = 1.5
const MAX_SCALE = 3
const SLOW = 300
const MEDIUM = 400
const FAST = 500
const SPEEDS = {"SLOW":SLOW, 
				"MEDIUM":MEDIUM, 
				"FAST":FAST}
@export var animation_node : AnimationPlayer
@export var sprite : Sprite2D
@export var hitbox_node : CollisionShape2D
var object_speed:float
var y_speed:float
func _ready():
	pass
	#var randomScale = randf_range(MIN_SCALE, MAX_SCALE)
	var randomScale = 2.25		# QUITÉ EL RANDOM DE LA ESCALA PORQUE QUEDAN MEJOR LOS PATRONES, HAY QUE HABLARLO
	scale = Vector2(randomScale, randomScale)
	
	#velocity = Vector2(randf_range(base_velocity_min, base_velocity_max), 0.0);
	#object_speed = randf_range(base_velocity_min, base_velocity_max)
	
func _physics_process(delta):
	position.x -= object_speed * delta * Jose_Miguel.get_speed()
	position.y -= y_speed * delta * Jose_Miguel.get_speed()

#Esta funcion se debe llamar desde el objeto que cree a este
func setSpeed(speed:String):
	if!(speed in SPEEDS.keys()):
		print("Velocidad no aceptada")
		return
	object_speed = SPEEDS[speed]

func _on_hit_player(body:Node2D):
	object_speed = 0 
	hitbox_node.set_deferred("disabled",true)
	animation_node.play("explotion")



func _on_animation_player_animation_finished(anim_name : String):
	if anim_name == "explotion" or anim_name == "explotion_parry":
		destroy()


#Se necesita implementar la direccion del golpe del jugador
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

