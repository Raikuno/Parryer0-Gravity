extends Node
class_name State_Machine

@export var initial_state:State
var current_state:State
var states:Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	#Localizacion y guardado de estados en diccionario. Conexion de la señal con la función
	for child in get_children():
		states[child.name.to_lower()] = child
		child.state_swap.connect(swapState)
	#Ejecucion de funcion de "entrada" de estado inicial y activación como estado "actual" 
	initial_state.onEnter()
	current_state = initial_state


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_state.process(delta)

func swapState(old:String, new:String):
	var old_state:State
	var new_state:State
	#Llamada a las funciones de "entrada" y "salida" del estado
	old_state = states[old.to_lower()]
	new_state = states[new.to_lower()]
	old_state.onExited()
	new_state.onEnter()
	#Reemplazo del estado actual
	current_state = new_state
