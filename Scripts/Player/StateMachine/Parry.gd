extends State

@export var animation_player:AnimationPlayer
@export var parry_hitbox:CollisionShape2D
@export var parry_sound:AudioStreamPlayer
#(Override) Anula la funcion de State
func onEnter():
	if(not animation_player.animation_finished.is_connected(parry_ended)):
		animation_player.animation_finished.connect(parry_ended)
	assigned_character.disableParry()
	assigned_character.changeParryAnimation()
	assigned_character.set_collision_layer_value(1, false)
	parry_hitbox.set_deferred("disabled", false)

#(Override) Anula la funcion de State
func onExited():
	assigned_character.set_collision_layer_value(1, true)
	parry_hitbox.set_deferred("disabled", true)

#(Override) Anula la funcion de State
func process(delta):
	pass

func parry_ended(anim_name:String):
	if(anim_name == "Parry" || 'Parry_Red'):
		state_swap.emit(name, "air")

func parry_collision(area:Area2D):
	if(area is EnemyType && !area.being_parried):
		parry_sound.play()
		area.parried(assigned_character)
		if(area.can_bounce()):
			assigned_character.invertGravity()
		assigned_character.resetParry()
		assigned_character.hit_stop(0.05, 0.2)
		state_swap.emit(name, "air")

