extends VehicleBody3D
#var Vida=5
#@export (NodePath) var InterfacePath=""
#var Interface = null
#signal VidaAlterada

var danos = 0

@onready var tiro = load("res://3D/tiro_personagem.tscn")

@export var engine_force_value: float = 500.0
@export var steer_value: float = 0.3
@export var max_steering_angle: float = 60.0

@export var front_left_wheel: VehicleWheel3D = null
@export var front_right_wheel: VehicleWheel3D = null
@export var rear_left_wheel: VehicleWheel3D = null
@export var rear_right_wheel: VehicleWheel3D = null

@export var health := 10
var is_dead := false
var knockbacked := false
var gravity = 0
var movement_velocity : Vector3

var pode_atirar = false

@onready var madeira_container: HBoxContainer = $HUD/madeira_container
@onready var madeira := 0
@onready var direcao_dragao = $PivotDragao

#@onready var escravos: HBoxContainer = $HUD/madeira_container/timer_label	
#@onready var escravos : = 0

func _ready():
#	if Interface:
#		VidaAlterada.connect(Interface.AtualizarBarraVida)
	var suspension_stiffness = 5.0
	var suspension_travel = 0.6
	
	front_left_wheel.suspension_stiffness = suspension_stiffness
	front_right_wheel.suspension_stiffness = suspension_stiffness
	rear_left_wheel.suspension_stiffness = suspension_stiffness
	rear_right_wheel.suspension_stiffness = suspension_stiffness
	
	front_left_wheel.suspension_travel = suspension_travel
	front_right_wheel.suspension_travel = suspension_travel
	rear_left_wheel.suspension_travel = suspension_travel
	rear_right_wheel.suspension_travel = suspension_travel
	
	self.center_of_mass = Vector3(0, -0.5, 0)
	
#func Dano(Valor):
#	emit_signal("VidaAlterada", Vida)	

func _physics_process(delta):
	var engine_force = 0.0
	var steer_angle = 0.0

	if Input.is_action_pressed("up"):
		engine_force = engine_force_value
	elif Input.is_action_pressed("down"):
		engine_force = -engine_force_value * 0.5

	if Input.is_action_pressed("right"):
		steer_angle = steer_value
	elif Input.is_action_pressed("left"):
		steer_angle = -steer_value
			
	steer_angle = clamp(steer_angle, -max_steering_angle, max_steering_angle)

	apply_impulse(basis.z * engine_force)

	front_left_wheel.steering = steer_angle
	front_right_wheel.steering = steer_angle
	
	if danos > 6:
		get_tree().change_scene_to_file("res://3D/mar_de_fortaleza_fase2.tscn")

func collect_escravo():
	pass

func collect_madeira():
	madeira += 1
	madeira_container.update_madeira(madeira)
		
func knockback(impact_point: Vector3, force: Vector3) ->void:
	madeira_container.update_life(health)	
	force.y = abs(force.y)
	movement_velocity = force.limit_length(15.0)	

func _on_hurtbox_body_entered(body):
	if health > 0:
		health -= 1
	else:
		is_dead = true
		get_parent().get_node("game_over").visible = true
		get_tree().paused = true
	var body_collision = (body.global_position - global_position)
	var force = -body_collision
	force *= 10.0
	gravity = -5.0
	knockback(body_collision, force)
	knockbacked = true
	await get_tree().create_timer(0.3).timeout
	knockbacked = false
			
		
		
		
		
		
		


func dano(body: Node3D) -> void:
	
	if body.is_in_group("TiroInimigo"):
		danos += 1
		body.queue_free()
