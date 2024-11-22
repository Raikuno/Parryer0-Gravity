extends State


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(assigned_character.velocity.y == 0):
		state_swap.emit(name, "ground")
