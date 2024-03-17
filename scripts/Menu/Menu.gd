extends Node3D

signal bouton_jouer_press
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$MenuConnection.hide()
	$MenuOptions.hide()

func _on_jouer_pressed():
	bouton_jouer_press.emit()
	$MenuPrincipal.hide()
	$MenuConnection.show()


func _on_options_pressed():
	$MenuPrincipal.hide()
	$MenuOptions.show()


func _on_quitter_pressed():
	get_tree().quit()
