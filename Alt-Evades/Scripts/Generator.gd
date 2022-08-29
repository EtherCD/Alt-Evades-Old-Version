extends Node

export(int) var col=10
export(bool) var standart=false;
export(bool) var dark=false;
export(bool) var blue=false;
export(bool) var red=false;
export(bool) var pink=false;
export(float) var size=0.6;
export(float) var auraSize = 1.8;

var arr = []

# Called when the node enters the scene tree for the first time.
func _ready():
	_create()
	
func _create():
	for i in range(0, col):
		var enemy = preload("res://Enemy.tscn").instance()
		var vec = Vector2(rand_range(141,3061), rand_range(1,671))
		enemy.position = vec;
		enemy.size=size;
		var maybe_color = []
		if standart:
			maybe_color.append(4)
		if dark:
			maybe_color.append(0)
		if blue:
			maybe_color.append(1)
		if red:
			maybe_color.append(2)
		if pink:
			maybe_color.append(3)
		if maybe_color != []:
			enemy.cType = maybe_color[randi() % maybe_color.size()]
			enemy.auraSize=auraSize;
		else:
			enemy.cType = 0;
		add_child(enemy)
		arr.append(enemy)

func _remove():
	for i in arr:
		i.queue_free()
	arr = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
