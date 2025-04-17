extends Node2D

var joystick_radius = 50  # Adjust the radius according to your joystick size

var joystick_center = Vector2.ZERO
var joystick_direction = Vector2.ZERO

func _ready():
	joystick_center = $TextureRect  # Get the center position of the joystick

func _input(event):
	if event is InputEventScreenTouch:
		var touch_pos = event.position
		var distance = touch_pos.distance_to(joystick_center)

		# Check if the touch is within the joystick radius
		if distance <= joystick_radius:
			joystick_direction = (touch_pos - joystick_center).normalized()
		else:
			# If the touch is outside the radius, limit the direction vector to the joystick radius
			joystick_direction = (touch_pos - joystick_center).normalized() * joystick_radius

func _process(delta):
	# Move the character or perform actions based on the joystick direction
	# For example:
	if joystick_direction != Vector2.ZERO:
		var movement_speed = 100  # Adjust the movement speed according to your game
		var movement_vector = joystick_direction * movement_speed * delta
		$"../Player2".translate(movement_vector)
