extends Control

signal bouton_retour_pressed(Vector_position)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_audio_button_pressed():
	pass # Replace with function body.


func _on_retour_button_pressed():
	bouton_retour_pressed.emit(Vector3(0, 1, 5))
