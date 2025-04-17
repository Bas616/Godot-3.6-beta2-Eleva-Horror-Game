extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$RootNode/AnimationPlayer.play("mixamo.com")
	$RootNode/AnimationPlayer.playback_speed = 2
