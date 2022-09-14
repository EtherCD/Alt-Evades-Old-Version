extends Node

export(bool) var standartGenerator=false;
export(int) var col=0;
export(bool) var standart=false;
export(bool) var dark=false;
export(bool) var blue=false;
export(bool) var red=false;
export(bool) var pink=false;
export(bool) var honey=false;
export(float) var size=0.6;

var arr_s = []

var arr = []

# Called when the node enters the scene tree for the first time.
func _ready():
	_create()

func _add(cType, size, col):
	arr_s.append([cType, size, col, 0])

func _create():
	var var2 = 0
	randomize()
	if not standartGenerator:
		for j in arr_s:
			if j[2] >= 1 and j[3]<j[2] and col>var2:
				for i in range(0, j[2]):
					var enemy = preload("res://Enemy.tscn").instance()
					var vec = Vector2(rand_range(141,3061), rand_range(1,671))
					enemy.position = vec;
					enemy.size=j[1]
					if j[0] >= 0:
						enemy.cType = j[0]
					else:
						enemy.cType = 0;
					j[3]+=1
					var2+=1
					add_child(enemy)
					arr.append(enemy)
			elif j[2] <= 0 and col>var2:
				for i in range(0, col-var2):
					var enemy = preload("res://Enemy.tscn").instance()
					var vec = Vector2(rand_range(141,3061), rand_range(1,671))
					enemy.position = vec;
					enemy.size=j[1]
					if j[0] >= 0:
						enemy.cType = j[0]
					else:
						enemy.cType = 0;
					add_child(enemy)
					arr.append(enemy)
					var2+=1
	else:
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
			if honey:
				maybe_color.append(5)
			if maybe_color != []:
				enemy.cType = maybe_color[randi() % maybe_color.size()]
			else:
				enemy.cType = 0;
			add_child(enemy)
			arr.append(enemy)

func _remove():
	for i in arr:
		i.queue_free()
	arr_s = []
	arr = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
