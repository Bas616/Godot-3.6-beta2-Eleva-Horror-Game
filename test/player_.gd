extends Sprite

const MAX_LENGTH := 20

export var color : Color
var speed := 200.0
var motion : Vector2
var path := []

func _process(delta):
	rotation = lerp_angle(rotation,motion.angle(),0.3) if motion.length() > 0 else rotation
	translate(motion*speed*delta)
	
	path.append(global_position)
	if path.size() > MAX_LENGTH: path.pop_front()

	update()

func _draw():
	draw_set_transform(Vector2.ZERO+Vector2(-30,0),0,Vector2.ONE)
	var size := path.size()
	for i in size:
		var a := float(i)/size
		color.a = a
		draw_circle(transform.xform_inv(path[i]),8*a,color.lightened(1-a))

func _on_Joystick_pos_changed(pos):
	#YOU DO NOT NEED TO NORMALIZE THE RECEIVED pos OF THE SIGNALS
	motion = pos

func _on_Joystick_stopped_updating(pos):
	#YOU DO NOT NEED TO NORMALIZE THE RECEIVED pos OF THE SIGNALS
	motion = pos
