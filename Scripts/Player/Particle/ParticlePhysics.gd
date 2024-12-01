extends CPUParticles2D

func show_death(player_color:String, initial_speed:float):
	if(player_color == "BLUE"):
		set_deferred("texture", load("res://Resources/Particles/ParticleA.png"))
		set_deferred("direction", Vector2(0, -1))
	elif(player_color == "RED"):
		set_deferred("texture", load("res://Resources/Particles/ParticleB.png"))
		set_deferred("gravity", -gravity)
		set_deferred("direction", Vector2(0, 1))
	set_deferred("initial_velocity_min", initial_speed/2)
	set_deferred("initial_velocity_max", initial_speed/2)
	set_deferred("emitting", true)

