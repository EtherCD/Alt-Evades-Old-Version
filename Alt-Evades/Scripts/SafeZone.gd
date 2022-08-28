extends StaticBody2D

export(int) var id = 0

export(bool) var right_left = true
var can_teleport = true

func do_lock():
	can_teleport = false
	get_tree().create_timer(0.3, true)
	can_teleport = true


func _on_Detector_body_entered(body):
	for portal in get_tree().get_nodes_in_group("portal"):
		if portal != body and body.name == "Player" and portal != self and portal.can_teleport:
			var pos = portal.global_position;
			if portal.right_left:
				body.global_position=Vector2(pos.x+250, pos.y+rand_range(250, 500))
			else:
				body.global_position=Vector2(pos.x-250, pos.y+rand_range(250, 500))				
			do_lock()
