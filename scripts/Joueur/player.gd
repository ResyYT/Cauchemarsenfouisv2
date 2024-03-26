extends Node3D

signal change_mouvement
# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuEchap.hide()
	$MenuControle.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("echap"):
		get_node("MenuEchap").show()
		change_mouvement.emit()


func _on_menu_echap_afficher_cacher_menu(MenuAfficher, MenuCacher):
	if get_node(MenuCacher) != null:
		get_node(MenuCacher).hide()
	elif get_node(MenuAfficher) != null:
		get_node(MenuAfficher).show()
