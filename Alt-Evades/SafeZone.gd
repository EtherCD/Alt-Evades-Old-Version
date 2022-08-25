extends StaticBody2D

export(int) var id = 0

var lock_portal = false

func do_lock():
	lock_portal = true
	get_tree().create_timer(0.3, true)
	lock_portal = false
