extends Control

signal afficher_cacher_menu(MenuAfficher, MenuCacher)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_contrôle_bouton_pressed():
	afficher_cacher_menu.emit("MenuControle", "MenuEchap")


func _on_quitter_bouton_pressed():
	SceneSwitcher.switch_scene("res://scenes/Menu/Menu.tscn")


func _on_continuer_bouton_pressed():
	afficher_cacher_menu.emit(null, "MenuEchap")
