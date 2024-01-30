extends Control

func _ready():
	if OS.has_feature("dedicated_server"):
		print("loading server...")
		get_tree().change_scene_to_file("res://scenes/connection.tscn")

func _on_jouer_pressed():
	get_tree().change_scene_to_file("res://scenes/connection.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")


func _on_quitter_pressed():
	get_tree().quit()
