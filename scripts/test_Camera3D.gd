extends Camera3D

var ok = 0
const SPEED = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = Vector3.ZERO
	
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_down"):
		motion.z += 1
	if Input.is_action_pressed("ui_up"):
		motion.z -= 1
	
	motion = motion.normalized() * SPEED
	translate(motion * delta)
	
	var motion = Vector3.ZERO
	if ok == 1:
		motion.z += 1
		motion = motion.normalized() * SPEED
		translate(motion * delta)
	var camera_position = global_transform.origin
	print("Position de la caméra : ", camera_position)
	if camera_position.z > 10:
		print("ok")
		motion.z = 0
		motion = motion.normalized() * SPEED
		translate(motion * delta)


func _on_test_menu_hud_bouton_press():
	ok = 1
