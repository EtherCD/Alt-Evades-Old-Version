extends StaticBody2D

export(int) var id = 0
export(bool) var right_left = true
export(int) var area = 2
export(bool) var is_win=false
export(int) var end_level = 0;
export(int) var win_evp = 0;
export(String) var win_text = "";

var can_teleport = false

func do_lock():
	can_teleport = not can_teleport

func _on_Detector_body_entered(body):
	for portal in get_tree().get_nodes_in_group("portal"):
		if portal != body \
			and body.name == "Player" \
			and portal != self \
			and self.id == portal.id:
			var pos = portal.global_position;
			if portal.right_left:
				body.global_position=Vector2(pos.x+200, body.global_position.y)
				body.cArea+=1
			else:
				body.global_position=Vector2(pos.x-120, body.global_position.y)				
				body.cArea-=1
			if is_win and end_level==body.cArea:
				body.cArea+=1
				body.il_(win_text, true)
			elif end_level!=body.cArea:
				body.il_(win_text, false)
			portal.do_lock()
