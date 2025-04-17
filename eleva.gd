extends Spatial

onready var buttoneleva = $"../TouchScreenButton"
func _on_Area_body_entered(body):
	$MeshInstance/StaticBody/CollisionShape.translation = Vector3(0, 1, 0.05)
	$AnimationPlayer.play("a (copy)")
	$AnimationPlayer.queue("RESET")
	$Area.translation = Vector3(0, 4, 0)

func _physics_process(delta):
	if Input.is_action_just_pressed("eleva") or buttoneleva.is_pressed():
		$AnimationPlayer.play("RESET (copy) (copy)")
		$AnimationPlayer.queue("a")
		$AnimationPlayer.queue("New Anim")
		buttoneleva.hide()



func _on_AnimationPlayer_animation_finished(a):
	$MeshInstance/StaticBody/CollisionShape.translation = Vector3(0, 1, 0.05)


func _on_Button5_button_up():
	$AnimationPlayer.play("RESET (copy) (copy)")
	$AnimationPlayer.queue("a")
	$AnimationPlayer.queue("New Anim")
	


