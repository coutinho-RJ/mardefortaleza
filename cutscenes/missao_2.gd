extends Node2D

@onready var cutscne = $AnimationPlayer

var player_in_area = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	var area = get_tree().get_first_node_in_group("area")
	var cutscene = get_tree().get_first_node_in_group("cutscene")
	var level_1 = get_tree().get_first_node_in_group("level_1")
	var objects = get_tree().get_first_node_in_group("visible")
	var missao2 = get_tree().get_first_node_in_group("missao2")
	
	if body.is_in_group("player"):
		player_in_area = true
		missao2.visible = true
		
		cutscne.play("missao_2")
		body.idle_left()
		body.set_process(false)
		body.set_physics_process(false)
		
		
		body.stop_player()
		body.set_process(false)
		body.set_physics_process(false)
		
		await get_tree().create_timer(16).timeout
	
		await get_tree().change_scene_to_file("res://Terrain/terrain_teste_2.tscn")
