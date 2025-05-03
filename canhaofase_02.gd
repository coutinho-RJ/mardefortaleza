extends Node3D

@onready var tiro = load("res://3D/tiro_canhão.tscn")
@onready var raycast = $RayCast3D
@onready var timer = $Timer_Canhao
var tiro_ativado = true
var pode_atirar = true
var colidindo = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if raycast.is_colliding() and pode_atirar and tiro_ativado:
		print("Dentro do collision")
		colidindo = true
		pode_atirar = false
		timer.start_new(self, 1)
	else:
		colidindo = false
	


func habilitar_tiro() -> void:
	print("Habilitou tiro dentro do canhao")
	pode_atirar = true
