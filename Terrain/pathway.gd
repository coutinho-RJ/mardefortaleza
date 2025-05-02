extends Area2D

func _ready():
	pass
	
func _process(delta):
	pass

func _on_body_entered(body):
	call_deferred("change_level")

func change_level():
	get_tree().change_scene_to_file("res://Terrain/" + name + ".tscn")
