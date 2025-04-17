extends Spatial
func _on_Area_body_entered(body):
	$MeshInstance.translation = Vector3(0, 4, 0.05)
	
	$AnimationPlayer.play("a")
	$AnimationPlayer.queue("New Anim")
	
	$Area.translation = Vector3(0, 4, 0)





func _on_AnimationPlayer_animation_finished(a):
	$MeshInstance/StaticBody/CollisionShape.translation = Vector3(0, 4, 0.05)
	



func _on_Area44_body_entered(body):
	$AnimationPlayer.play("New Anim (2) 2")
