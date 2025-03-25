extends Area3D

const ROTATION_SPEED: = 50

var start_pos := position.y
var end_pos := position.y + 0.5
@onready var coletar: AudioStreamPlayer = $coletar as AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
#func _ready():
	#var Madeira_tween := create_tween().set_loops().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
	#Madeira_tween.tween_porperty(self, "position:y", end_pos,  1.0).from(start_pos)
	#Madeira_tween.tween_porperty(self, "position:y", start_pos, 1.0).from(end_pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROTATION_SPEED * delta))


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Barco":
		body.collect_madeira()
		coletar.play()
		await coletar.finished
		queue_free()
		
