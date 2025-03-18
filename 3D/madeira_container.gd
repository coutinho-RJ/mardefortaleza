extends HBoxContainer
@onready var madeira_label: Label = $madeira_label
@onready var life_label: Label = $life_label

func _ready():
	life_label.text = str(5)
	
func update_madeira(amount: int):
	madeira_label.text = "%d" % amount
	

func update_life(health: int):
	life_label.text ="%d"% health
