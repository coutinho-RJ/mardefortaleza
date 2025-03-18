extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func mudarcena(body: Node3D) -> void:
	if body.name == "Barco":
		get_tree().change_scene_to_file("res://level_1.tscn")
