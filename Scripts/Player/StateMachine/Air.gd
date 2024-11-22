extends State


#(Override) Anula la funcion de State
func process(delta):
	if (assigned_character.can_parry&&Input.is_action_just_pressed("button")):
		state_swap.emit(name, "parry")

	if(assigned_character.velocity.y == 0):
		state_swap.emit(name, "ground")
