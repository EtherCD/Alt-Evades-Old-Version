extends Node2D

export(bool) var dark = false;
export(bool) var blue = false;
export(bool) var red = false;
export(int)  var colEnemy = 10;

func _ready():
	pass

func _process(delta):
	if $Teleport.can_teleport:
		_work()

func _work():
	for i in $Generator.get_child_count():
		remove_child($Generator.get_child(i))
	#$Generator.get_script().restart
