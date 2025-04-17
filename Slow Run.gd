extends Spatial
func _ready():
	$RootNode/AnimationPlayer.play("mixamo.com")
	$RootNode/AnimationPlayer.playback_speed = 2
