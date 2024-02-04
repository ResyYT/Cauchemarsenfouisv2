extends Node3D

@onready var paused_menu = $EchapMenu

var paused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	paused_menu.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("echap"):
		pauseMenu()
	
func pauseMenu():
	if paused == false:
		paused_menu.hide()
		Engine.time_scale = 1
		paused = true
	elif paused == true:
		paused_menu.show()
		Engine.time_scale = 0
		paused = false
