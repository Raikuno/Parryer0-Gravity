extends State

@export var animation_player:AnimationPlayer
@export var player_hitbox:CollisionShape2D
@export var parry_hitbox:CollisionShape2D
#(Override) Anula la funcion de State
func onEnter():
	if(not animation_player.animation_finished.is_connected(parry_ended)):
		animation_player.animation_finished.connect(parry_ended)
	assigned_character.disableParry()
	animation_player.play("parry_test")
	parry_hitbox.set_deferred("disabled", false)

#(Override) Anula la funcion de State
func onExited():
	animation_player.play("RESET")
	parry_hitbox.set_deferred("disabled", true)

#(Override) Anula la funcion de State
func process(delta):
	pass

func parry_ended(anim_name:String):
	if(anim_name == "parry_test"):
		state_swap.emit(name, "air")

