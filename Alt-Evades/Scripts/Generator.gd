extends Node

export(int) var col=10
export(bool) var dark=false;
export(bool) var blue=false;
export(bool) var red=false;

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, col):
		var enemy = preload("res://Enemy.tscn").instance()
		var vec = Vector2(rand_range(141,3061), rand_range(1,671))
		enemy.position = vec;
		var maybe_color = []
		if dark:
			maybe_color.append(0)
		if blue:
			maybe_color.append(1)
		if red:
			maybe_color.append(2)
		if maybe_color != []:
			enemy.cType = maybe_color[randi() % maybe_color.size()]
		else:
			enemy.cType = 0;
		add_child(enemy)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
