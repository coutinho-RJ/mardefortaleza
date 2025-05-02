extends Node3D

@onready var tiro = load("res://3D/tiro_personagem.tscn")
@onready var tiro_enemy = load("res://3D/tiro_canhão.tscn")
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	

	$Barco.pode_atirar = true
	print(str($Barco/HUD/ProgressBar.value))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if $Alvo1.alvo_acertado:
		$canhaofase03.tiro_ativado = false
		#$Alvo1.visibility = false

	if Input.is_action_just_pressed("atirar"):
		shoot()
		
	if $canhaofase03.colidindo:
		shoot_enemy($canhaofase03)

	if $canhaofase04.colidindo:
		shoot_enemy($canhaofase04)
	
	if $canhaofase05.colidindo:
		shoot_enemy($canhaofase05)
	
	if $canhaofase06.colidindo:
		shoot_enemy($canhaofase06)
	
	if $canhaofase07.colidindo:
		shoot_enemy($canhaofase07)
		
	if $canhaofase08.colidindo:
		shoot_enemy($canhaofase08)
		
	if $canhaofase09.colidindo:
		shoot_enemy($canhaofase09)
		
	if $canhaofase10.colidindo:
		shoot_enemy($canhaofase10)
		
	if $canhaofase11.colidindo:
		shoot_enemy($canhaofase11)
		
	if $canhaofase12.colidindo:
		shoot_enemy($canhaofase12)
		
	if $canhaofase13.colidindo:
		shoot_enemy($canhaofase13)
		
		
func shoot():
	
	var direcao = $Barco.global_transform.basis.z.normalized()
	var t = tiro.instantiate()
	t.position = $Barco.position 
	#t.position = $Barco.global_transform.origin + direcao * 2  # ajusta o '2' conforme o tamanho 
	t.velocity = direcao * 100
	add_child(t) 
	
	
func shoot_enemy(canhao):
	
	var direcao = canhao.raycast.global_transform.basis.z.normalized()
	var t = tiro_enemy.instantiate()
	t.position = canhao.position
	t.velocity = direcao * 230
	add_child(t) 


func cena_video(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://3D/Filme/Lore_Dragao_do_Mar_Parte_I.ogv")
