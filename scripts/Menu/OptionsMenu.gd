extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_audio_button_pressed():
	pass # Replace with function body.


func _on_retour_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_start.tscn")
