extends KinematicBody
#Variables
var global = "root/global"

const GRAVITY = -20
var vel = Vector3()
const MAX_SPEED = 2
var player_speed = 2
const ACCEL = 2
var snapped = false
var dir = Vector3()

const DEACCEL= 8
const MAX_SLOPE_ANGLE = 40

var camera
var rotation_helper

var MOUSE_SENSITIVITY = 0.075

const MAX_SPRINT_SPEED = 2
const SPRINT_ACCEL = 2
var is_sprinting = false

var flashlight



var melee_damage = 1
var run_speed = 3 # Running speed in m/s
var walk_speed = run_speed / 0.5
var speed = 2
var current_speed = run_speed
var h_acceleration = 6
var normal_acceleration = 6
var jump = 4
var full_contact = false
var mouse_sensitivity = 0.1
var joystick_deadzone = 0.2
var target_location = Vector3(0, 0.5, 0)
var crouch_speed = run_speed / 2
var jump_height = 4

var ground_acceleration = 10
var air_acceleration = 5
var acceleration = air_acceleration
var velocity = Vector3() # Direction with acceleration added
var movement = Vector3() # Velocity with gravity added

var gravity = 9.8
var gravity_vec = Vector3()


var falling_velocity = 0
var crouched = false
var can_crouch = true
var isHoldingObject = false
var HeldObject = null
var direction = Vector3()
var h_velocity = Vector3()
var extra = Vector3()
func _ready():
	camera = $rotation_helper/Camera
	rotation_helper = $rotation_helper
	flashlight = $rotation_helper/Flashlight
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	process_input(delta)
	process_movement(delta)

func process_input(delta):

	# ----------------------------------
	# Walking
	dir = Vector3()
	var cam_xform = camera.get_global_transform()

	var input_movement_vector = Vector2()

	if Input.is_key_pressed(KEY_W):
		input_movement_vector.y += 1
	if Input.is_key_pressed(KEY_S):
		input_movement_vector.y -= 1
	if Input.is_key_pressed(KEY_A):
		input_movement_vector.x -= 1
	if Input.is_key_pressed(KEY_D):
		input_movement_vector.x += 1

	input_movement_vector = input_movement_vector.normalized()

	dir += -cam_xform.basis.z.normalized() * input_movement_vector.y
	dir += cam_xform.basis.x.normalized() * input_movement_vector.x
	# ----------------------------------

	# ----------------------------------
	#if is_on_floor():
		#if Input.is_key_pressed(KEY_SPACE):
			#vel.y = JUMP_SPEED
			
	# ----------------------------------

	# ----------------------------------
	# Capturing/Freeing the cursor
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# ----------------------------------

func process_movement(delta):
	dir.y = 0
	dir = dir.normalized()

	vel.y += delta * GRAVITY

	var hvel = vel
	hvel.y = 0

	var target = dir
	target *= MAX_SPEED

	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL

	hvel = hvel.linear_interpolate(target, accel * delta)
	vel.x = hvel.x
	vel.z = hvel.z
	vel = move_and_slide(vel, Vector3(0, 1, 0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY))
		self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))

		var camera_rot = rotation_helper.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -80, 80)
		rotation_helper.rotation_degrees = camera_rot

# ----------------------------------
# Turning the flashlight on/off
	if Input.is_key_pressed(KEY_F):
		if flashlight.is_visible_in_tree():
			flashlight.hide()
		else:
			flashlight.show()
# ----------------------------------


func _on_Area_body_entered(body):
	pass # Replace with function body.


func _on_Area_body_exited(body):
	pass # Replace with function body.
