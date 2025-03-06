extends Area2D

@export var cena_destino: String

func _on_body_entered(body):
	if body is CharacterBody2D:
		GerenciadorCena.ultima_posicao = body.position
		GerenciadorCena.cena_anterior = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file(cena_destino)
