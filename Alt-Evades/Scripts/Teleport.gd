extends StaticBody2D

export(int) var id = 0
export(bool) var right_left = true
export(int) var area = 2;
var can_teleport = false

func do_lock():
	can_teleport = not can_teleport

func _on_Detector_body_entered(body):
	for portal in get_tree().get_nodes_in_group("portal"):
		if portal != body and body.name == "Player" and portal != self:
			var pos = portal.global_position;
			if portal.right_left:
				body.global_position=Vector2(pos.x+250, pos.y+rand_range(250, 500))
				body.cArea+=1
			else:
				body.global_position=Vector2(pos.x-250, pos.y+rand_range(250, 500))				
				body.cArea-=1
			portal.do_lock()
