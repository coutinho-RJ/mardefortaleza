extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func novo_jogo():
	get_tree().change_scene_to_file("res://mar_de_fortaleza.tscn")
