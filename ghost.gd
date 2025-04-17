extends KinematicBody
# Player reference
var player: Node = null

# AI movement speed
var speed: float = 2

# Gravity variables
var gravity: float = 5
var velocity: Vector3 = Vector3.ZERO

# Area reference
var area: Area = null
var playerEntered: bool = false

func _ready():
	player = get_node("../Player2")  # Change "/root/Player" to the path of your player node
	connect("body_entered", self, "_on_Area_body_entered")
	$"Slow Run2/RootNode/AnimationPlayer".play("mixamo.com")
	$"Slow Run2/RootNode/AnimationPlayer".playback_speed = 2

	# Get a reference to the area node
	area = get_node("../Area")  # Change "Area" to the path of your Area node
	area.connect("body_entered", self, "_on_Area_body_entered")
	area.connect("body_exited", self, "_on_Area_body_exited")

func _process(delta: float):
	if playerEntered:
		# Call the function to move towards the player
		move_towards_player(delta)
	var direction = player.global_transform.origin - global_transform.origin
	look_at(global_transform.origin - direction, Vector3.UP)
	rotation.x = 0
	rotation.z = 0

func move_towards_player(delta: float):
	# Calculate the direction towards the player
	var direction = (player.translation - translation).normalized()

	# Apply gravity
	velocity.y -= gravity * delta

	# Move the AI horizontally towards the player
	move_and_slide(direction * speed + velocity)

	# Reset vertical velocity when grounded
	if is_on_floor():
		velocity.y = 0

func _on_Area_body_entered(body: Node):
	if body.is_in_group("Player"):
		playerEntered = true
		

func _on_Area_body_exited(body: Node):
	if body.is_in_group("Player"):
		playerEntered = false
		





func _on_Areaddd_body_entered(body):
	
	if body.is_in_group("Player"):
		get_tree().change_scene("res://dead.tscn")
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

