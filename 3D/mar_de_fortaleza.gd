extends Node3D

@onready var barco = $Barco
@onready var portal = load("res://3D/FX/Portal.tscn")
@export var madeiras = 3

var gerar_portal = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# 25 1 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if barco.madeira >= madeiras and gerar_portal:
		
		var barco_position = barco.position
		
		var portal_instancia = portal.instantiate()
		portal_instancia.global_position = Vector3(barco_position.x,barco_position.y,barco_position.z + 10)
		add_child(portal_instancia)
		
		gerar_portal = false
