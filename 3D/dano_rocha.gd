extends Area3D

@export var dano = 1
@onready var impacto_sound: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func dano_rocha(body: Node3D) -> void:
	GlobalCharacter.health -= dano
	impacto_sound.play()
