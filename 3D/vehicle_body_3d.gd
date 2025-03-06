extends VehicleBody3D
#var Vida=5
#@export (NodePath) var InterfacePath=""
#var Interface = null
#signal VidaAlterada
	
@export var engine_force_value: float = 500.0
@export var steer_value: float = 0.3
@export var max_steering_angle: float = 60.0

@export var front_left_wheel: VehicleWheel3D = null
@export var front_right_wheel: VehicleWheel3D = null
@export var rear_left_wheel: VehicleWheel3D = null
@export var rear_right_wheel: VehicleWheel3D = null

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

	apply_impulse(Vector3(0, 0, engine_force))

	front_left_wheel.steering = steer_angle
	front_right_wheel.steering = steer_angle
