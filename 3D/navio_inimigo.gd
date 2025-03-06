extends CharacterBody3D

const SPEED := 100.0
const CHASE_Range := 5.0

@export var target : VehicleBody3D
@onready var nav_agent = $nav_agent

func _process(delta):
	velocity = Vector3.ZERO
	
	if global_position.distance_to(target.global_position) < CHASE_Range:
		nav_agent.set_target_position(target.global_transform.origin)
		var next_nav_point = nav_agent.get_next_path_position()
		velocity = (next_nav_point - global_transform.origin).normalized() *SPEED * delta
		look_at(Vector3(target.global_position.x, global_position.y, target.global_position.z))
		
		move_and_slide()
