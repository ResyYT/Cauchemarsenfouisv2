extends Node3D

signal changer_position_camera(vector_position)

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$MenuConnection.hide()
	$MenuOptions.hide()

func _on_jouer_pressed():
	$SonBouton.play()
	changer_position_camera.emit(Vector3(0,0,0))
	$MenuPrincipal.hide()
	$MenuConnection.show()


func _on_options_pressed():
	$MenuPrincipal.hide()
	$MenuOptions.show()
	changer_position_camera.emit(Vector3(1, 13, 2))


func _on_quitter_pressed():
	get_tree().quit()


func _on_menu_connection_bouton_retour_pressed(Vector_position):
	$MenuConnection.hide()
	$MenuPrincipal.show()
	changer_position_camera.emit(Vector_position)
	


func _on_menu_options_bouton_retour_pressed(Vector_position):
	$MenuOptions.hide()
	$MenuPrincipal.show()
	changer_position_camera.emit(Vector_position)
