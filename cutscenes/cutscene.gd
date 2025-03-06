extends Control

@export var dialog_texts: Array[String] = ["O ano era 1884.\nA brisa salgada soprava forte sobre as aguas do Ceara, mas aquele não era um dia como os\noutros.\nAlgo grandioso estava prestes a acontecer",
										   "No porto de Fortaleza, entre o vai e vem de mercadores e senhores de engenho, um homem\nde olhos firmes e alma indomavel subia em sua jangada.",
										   "Seu nome...",
										   "Era Francisco Jose do Nascimento, mas tambem conhecido como...",
										   "O Dragão do Mar"]

var current_text_index = 0
var current_text = ""
var displayed_text = ""
var char_index = 0
var is_typing = false

@onready var label = $Panel/Label
@onready var text_timer = $texttimer

signal cutscene_finished

func _ready():
	show_text()
	
	await get_tree().create_timer(5).timeout
	

func show_text():
	if current_text_index < dialog_texts.size():
		current_text = dialog_texts[current_text_index]
		displayed_text = ""
		char_index = 0
		is_typing = true
		label.text = ""
		text_timer.start()
	else:
		end_cutscene()
	
func _on_texttimer_timeout() -> void:
	if char_index < current_text.length():
		displayed_text += current_text[char_index]
		label.text = displayed_text
		char_index += 1
		text_timer.start()
	else:
		is_typing = false
		
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if is_typing:
			label.text = current_text
			is_typing = false
			text_timer.stop()
		else:
			current_text_index += 1
			show_text()
	
func end_cutscene():
		emit_signal("cutscene_finished")
