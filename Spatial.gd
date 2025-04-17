extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_tree().get_root().find_node("", true ,false)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	if $Timer.is_stopped():
		
