extends KinematicBody
var health = 10
var melee_damage = 1
onready var animat4 = $"Slow Run/RootNode/AnimationPlayer"
var player: Node = null
# AI movement speed
# Player reference

# AI movement speed
var speed: float = 1

# Gravity variables
var gravity: float = 1
var velocity: Vector3 = Vector3.ZERO

func _ready():
	player = get_node("../Player")  # Change "/root/Player" to the path of your player node

func _physics_process(delta : float):
	var direction = (player.translation - translation).normalized()
	velocity.y -= gravity * delta
	move_and_slide(direction * speed + velocity)
	if is_on_floor():
		velocity.y = 0

	var direction1 = player.global_transform.origin - global_transform.origin
	look_at(global_transform.origin - direction1, Vector3.UP)
	rotation.x = 0
	rotation.z = 0
	animat4.play("mixamo.com")



func _on_Area_body_entered(body):
	pass

