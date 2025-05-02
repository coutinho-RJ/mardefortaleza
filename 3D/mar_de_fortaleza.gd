extends Node3D

@onready var barco = $Barco
@onready var portal = load("res://3D/FX/Portal.tscn")
var escravos_coletados = 0
@export var madeiras = 3

var gerar_portal = true

@onready var array_escravos = [$Escravos/Area3D2, $Escravos/Area3D3, $Escravos/Area3D4, $Escravos/Area3D5, $Escravos/Area3D6]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# 25 1 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$Control/VBoxContainer/PanelContainer/Label.text = "Time Left: " + str(int($Timer.time_left))
	
	if escravos_coletados >= 1 and gerar_portal:
		
		var barco_position = barco.position
		
		var portal_instancia = portal.instantiate()
		portal_instancia.position = Vector3(barco_position.x + 2,barco_position.y,barco_position.z)
		add_child(portal_instancia)
		
		gerar_portal = false
		
		


func _on_timer_timeout() -> void:
	pass # Replace with function body.


func mostrar_outro_escravo() -> void:
	
	randomizar_escravo()


func _on_area_3d_2_coletado() -> void:
	randomizar_escravo()


func _on_area_3d_3_coletado() -> void:
	randomizar_escravo()


func _on_area_3d_4_coletado() -> void:
	randomizar_escravo()


func _on_area_3d_5_coletado() -> void:
	randomizar_escravo()


func _on_area_3d_6_coletado() -> void:
	randomizar_escravo()


func randomizar_escravo():
	
	escravos_coletados += 1
	
	if not array_escravos.is_empty():
		print(array_escravos)
		
		var lenght = len(array_escravos) - 1
		var random = randi_range(0,lenght)
		
		array_escravos[random].visible = true
		array_escravos.remove_at(random)
