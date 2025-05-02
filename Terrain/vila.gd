extends Node2D

@onready var luz = $AnimationPlayer
@onready var escuro = $CanvasModulate

var played = false

func _ready() -> void:
	luz.play("light")

func _move():
	if played:
		return
	
	played = true
	
	var player = get_tree().get_first_node_in_group("player")
	
	player.set_process(false)
	player.set_physics_process(false)
	
	await get_tree().create_timer(2).timeout
	
	player.set_process(true)
	player.set_physics_process(true)
	

func _process(delta: float) -> void:
	_move()
	
	
	
	
