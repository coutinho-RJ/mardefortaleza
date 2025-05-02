extends CharacterBody3D

const MAX_LIFETIME = 5.0
var lifetime: float = 0.0

func _ready() -> void:
	name = "Tiro Canhão"
	print(name)

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	lifetime += delta
	if lifetime > MAX_LIFETIME:
		queue_free()
		
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if collision.get_collider() and collision.get_collider().name == "Tiro Personagem":
			# Se colidir com o Tiro Personagem, destruir os dois
			collision.get_collider().queue_free()
			queue_free()
