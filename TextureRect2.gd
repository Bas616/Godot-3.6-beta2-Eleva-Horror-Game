extends TextureRect

func _ready():
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	$Timer.start(3)
func _on_Timer_timeout():
	hide()
