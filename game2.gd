extends Spatial

var velocity := Vector3()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var movement_speed = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_TouchScreenButton_pressed():
	$Player2.velocity.z += -1



func _on_CheckButton_button_up():
	$Player2.velocity.z += -1
