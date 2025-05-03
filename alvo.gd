extends Node3D

var alvo_acertado = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	alvo_acertado = true
	print(body.name)
	body.queue_free()
	
