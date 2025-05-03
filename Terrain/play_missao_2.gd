extends Node2D

@onready var activate = $activate

func play_cutscene(body):
	if body.is_in_group("player"):
		pass
