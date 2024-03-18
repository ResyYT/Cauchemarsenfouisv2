extends Camera3D

var ok = 0
var target_position = Vector3(0, 0, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ok == 1:
		var speed = 3 # Vitesse de déplacement de la caméra
		# Calculer le vecteur de déplacement nécessaire pour atteindre la position cible
		var direction = (target_position - global_transform.origin).normalized()

		# Calculer la distance entre la caméra et la position cible
		var distance = global_transform.origin.distance_to(target_position)

		# Si la caméra n'a pas encore atteint la position cible
		if distance > 0.1: # Valeur arbitraire de tolérance pour arrêter le mouvement
			# Déplacer la caméra vers la position cible
			global_transform.origin += direction * speed * delta
		else:
			ok = 0


func _on_menu_changer_position_camera(vector_position):
	ok = 1
	target_position = vector_position
