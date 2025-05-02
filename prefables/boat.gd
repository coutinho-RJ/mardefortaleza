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
	if player_in_area and Input.is_action_just_pressed("ui_accept"):
		show_dialog()

func show_dialog():
	dialog_panel.visible = true
	dialog_label.text = "Gostaria de fazer uma viagem?"
	button_yes.visible = true	
	button_no.visible = true
	
func _on_sim_pressed():
	dialog_label.text = "Prepare-se"
	button_yes.visible = false
	button_no.visible = false
	
	await get_tree().create_timer(2).timeout
	if GerenciadorCena.level == 1:
		get_tree().change_scene_to_file("res://3D/mar_de_fortaleza.tscn")
	if GerenciadorCena.level == 2:
		get_tree().change_scene_to_file("res://3D/mar_de_fortaleza_fase2.tscn")
	
func _on_nao_pressed():
	button_yes.visible = false
	button_no.visible = false
	dialog_panel.visible = false

func _on_Area2D_body_entered(body):
	if body.name == "player":
		player_in_area = true

func _on_Area2D_body_exited(body):
	if body.name == "player":
		player_in_area = false
		dialog_panel.visible = false
