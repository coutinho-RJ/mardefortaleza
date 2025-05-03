extends CharacterBody3D

# Tempo máximo de vida do tiro (em segundos)
const MAX_LIFETIME = 5.0

# Contador interno
var lifetime: float = 0.0

func _ready() -> void:
	name = "Tiro Personagem"

func _physics_process(delta: float) -> void:
	move_and_slide()

	# Verifica colisão
	if get_slide_collision_count() > 0:
		queue_free()
		return

	# Atualiza o tempo de vida
	lifetime += delta
	if lifetime > MAX_LIFETIME:
		queue_free()
