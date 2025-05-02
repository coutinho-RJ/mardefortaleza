extends Node2D

@onready var cutscne = $AnimationPlayer

var player_in_area = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	var area = get_tree().get_first_node_in_group("area")
	
	if body.is_in_group("player"):
		cutscne.play("missao_1")
		
		player_in_area = true
		
		body.stop_player()
		body.set_process(false)
		body.set_physics_process(false)
		
		await get_tree().create_timer(20).timeout
		area.queue_free()
		body.set_process(true)
		body.set_physics_process(true)
		
		queue_free()
		
		
