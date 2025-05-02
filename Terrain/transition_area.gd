extends Area2D

@export var cena_destino: String

func _on_body_entered(body):
	call_deferred("change_level")

func change_level():
	Global.from_world = get_parent().name
	get_tree().change_scene_to_file("res://Terrain/" + name +".tscn")
