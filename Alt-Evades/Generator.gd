extends Node

export var col=10
export var dark=false;
export var blue=false;
export var red=false;

export var coefX = 481;
export var coefY = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy = preload("res://Enemy.tscn").instance()
	for i in range(col, 0):
		var vec = Vector2(rand_range(300,3000), rand_range(1,718))
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
