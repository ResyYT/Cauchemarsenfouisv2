extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_audio_button_pressed():
	pass # Replace with function body.


func _on_retour_button_pressed():
	SceneSwitcher.switch_scene("res://scenes/Menu/Menu.tscn")
