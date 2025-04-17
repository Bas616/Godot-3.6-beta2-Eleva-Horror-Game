extends AudioStreamPlayer2D
func _ready():
	connect("finished", self, "_on_Audio_finished")
func _on_AudioStreamPlayer2D_finished():
	stop()
