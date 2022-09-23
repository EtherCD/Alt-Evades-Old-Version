extends KinematicBody2D

var velocity = Vector2()  # The player's movement vector.
export(int) var speed = 350;
export(int) var cType = 0; #4 - Standart, 0 - Dark, 1 - Red, 2 - Blue, 3 - Pink
export(float) var size = 0.8;
export(float) var triger_size = 1.0;

var color = Color()

var entered = false
var triggered = false
var old_size = Vector2()
var body = null

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if cType == 0:
		color = Color(0,0,0,1)
	if cType == 1:
		color = Color(1,0,0,1)
	if cType == 2:
		color = Color(0,0,1,1)
	if cType == 3:
		color = Color(1,0.49,0.69,1)
	if cType == 4:
		color = Color(0.5,0.5,0.5,1)
	if cType == 5:
		color = Color(0.45,0.45,0)
	if cType == 6:
		color = Color(0.11, 0.73, 0.45)
		triger_size = 0.45
	velocity = Vector2(rand_range(0, 1), rand_range(0, 1))
	self.modulate = color
	self.scale = Vector2(size, size)
	$EnemyArea.name = "Enemy"
	$Node2D/Area2D.scale = Vector2(triger_size, triger_size);
	
	if cType >= 1 and cType <= 3:
		var aura = preload("res://Aura.tscn").instance()
		aura.position = Vector2(0, 0);
		aura.set(cType, 8);
		#aura.scale = Vector2(auraSize,auraSize);
		add_child(aura)

func _physics_process(delta):
	velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity * delta)
	if entered and cType == 5:
		var target = body.global_position
		velocity += global_position.direction_to(target)*20
		target-=global_position
		var direction_distance = target.length()*2.5
		if direction_distance == 0:
			direction_distance=1
		if velocity.length() > 0:
			velocity = velocity.normalized() * min(speed, direction_distance)
		if collision:
			velocity = velocity.bounce(collision.normal)
	elif entered and cType == 6 and not triggered:
		old_size = self.scale
		self.scale=scale*2
		if collision:
			velocity = velocity.bounce(collision.normal)
		triggered=true
	else:
		if collision:
			velocity = velocity.bounce(collision.normal)


func _on_Area2D_body_entered(body):
	if body.name == "Player" or body.name == "Bot":
		entered = true
		self.body=body

func _on_Area2D_body_exited(body):
	if body.name == "Player" or body.name == "Bot":
		entered = false
		self.body=body
		triggered=false
		if cType == 6:
			self.scale=old_size
