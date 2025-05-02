extends Node2D

func _ready():
	if Global.from_world != null:
		call_deferred("_posiciona_player")

func _posiciona_player():
	var marker_name = Global.from_world + "pos"
	
	# Busca apenas entre os filhos da cena atual!
	for child in get_children():
		if child.name == marker_name:
			$player.global_position = child.global_position
			print("Player posicionado em:", child.global_position)
			return
	
	print("❌ Marker não encontrado entre os filhos da cena atual")


	
