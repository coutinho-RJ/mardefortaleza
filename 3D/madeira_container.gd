extends HBoxContainer
@onready var madeira_label: Label = $madeira_label


func _ready():
	pass
	
	
func update_madeira(amount: int):
	madeira_label.text = "%d" % amount
	
	

func update_life(health: int):
	pass
	#life_label.text ="%d"% health
