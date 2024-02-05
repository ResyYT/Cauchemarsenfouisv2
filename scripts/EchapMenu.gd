extends Control

signal quit(boolean)
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("false")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_contrôle_bouton_pressed():
	get_tree().change_scene_to_file("res://scenes/controle_options.tscn")


func _on_quitter_bouton_pressed():
	quit.emit("true")
	get_tree().change_scene_to_file("res://scenes/menu_start.tscn")
