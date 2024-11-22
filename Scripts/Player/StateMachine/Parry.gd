extends State

@export var animation_player:AnimationPlayer

#(Override) Anula la funcion de State
func onEnter():
	if(not animation_player.animation_finished.is_connected(parry_ended)):
		animation_player.animation_finished.connect(parry_ended)
	assigned_character.disableParry()
	animation_player.play("parry_test")

#(Override) Anula la funcion de State
func onExit():
	animation_player.play("RESET")

#(Override) Anula la funcion de State
func process(delta):
	pass

func parry_ended(anim_name:String):
	if(anim_name == "parry_test"):
		state_swap.emit(name, "air")

