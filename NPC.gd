extends CharacterBody2D

@onready var dialog_panel = $DialogPanel
@onready var dialog_label = $DialogPanel/Label
@onready var button_yes = $DialogPanel/HBoxContainer/sim
@onready var button_no = $DialogPanel/HBoxContainer/nao

var player_in_area = false

func _ready():
	dialog_panel.visible = false
	dialog_label.autowrap_mode = TextServer.AUTOWRAP_WORD
	var new_font_size = 8
	dialog_label.add_theme_font_size_override("font_size", new_font_size)
	
	
func _process(delta):
	var player = get_tree().get_first_node_in_group("player")
	if player_in_area and Input.is_action_just_pressed("ui_accept"):
		show_dialog()
		player.set_process(false)
		player.set_physics_process(false)

func show_dialog():
	dialog_panel.visible = true
	dialog_label.text = "Garoto, você quer conhecer a historia do lendario Dragão do Mar?"
	button_yes.visible = true	
	button_no.visible = true
	
	
	
func _on_sim_pressed():
	dialog_label.text = "Otimo, sente-se, essa historia e bem longa..."
	button_yes.visible = false
	button_no.visible = false
	
	
	await get_tree().process_frame
	
	var player = get_tree().get_first_node_in_group("player")
	
	var cutscene = load("res://cutscenes/cutscene.tscn").instantiate()
	await get_tree().create_timer(2).timeout
	
	if player:
		var camera = player.get_node_or_null("camera")
		if camera:
			camera.enabled = false
			
	get_tree().current_scene.add_child(cutscene)
	
	
	
	await cutscene.cutscene_finished
	
	cutscene.queue_free()
	
	player.set_process(true)
	player.set_physics_process(true)
	
	if player:
		var camera = player.get_node_or_null("camera")
		if camera:
			camera.enabled = true
	
	
	
func _on_nao_pressed():
	dialog_label.text = "Talvez outro dia então..."
	button_yes.visible = false
	button_no.visible = false
	await get_tree().create_timer(1).timeout
	dialog_panel.visible = false
	
	var player = get_tree().get_first_node_in_group("player")
	player.set_process(true)
	player.set_physics_process(true)

func _on_Area2D_body_entered(body):
	if body.name == "player":
		player_in_area = true

func _on_Area2D_body_exited(body):
	if body.name == "player":
		player_in_area = false
		dialog_panel.visible = false
