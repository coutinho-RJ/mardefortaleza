extends Timer

class_name Timer_Canhao

@onready var canhao
# Called when the node enters the scene tree for the first time.
func start_new(canhao, time):
	self.canhao = canhao
	start(time)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
