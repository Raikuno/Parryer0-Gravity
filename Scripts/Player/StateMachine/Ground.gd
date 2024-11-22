extends State

#(Override) Anula la funcion de State
func onEnter():
	assigned_character.resetParry()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	if (Input.is_action_just_pressed("button")):
		assigned_character.invertGravity()
	
	if(assigned_character.velocity.y != 0):
		state_swap.emit(name, "air")