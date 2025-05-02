extends Node3D



func geraEscravos(valor):
	return get_children()[valor].duplicate()
		
func geraEscravosrandomico():
	return get_children()[randi() % get_children().size()].duplicate()
