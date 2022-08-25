extends KinematicBody2D

var velocity = Vector2()  # The player's movement vector.
export(int) var speed = 350;
export(int) var cType = 0; # 0 - Dark, 1 - Red, 2 - Blue,
var color = Color()

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if cType == 0:
		color = Color(0,0,0,1)
	if cType == 1:
		color = Color(1,0,0,1)
	if cType == 2:
		color = Color(0,0,1,1)
	velocity = Vector2(rand_range(0, 1), rand_range(0, 1))
	self.modulate = color
	self.scale = Vector2(0.3, 0.3)
	$EnemyArea.name = "Enemy"
	
	if cType == 1 or cType == 2:
		var aura = preload("res://Aura.tscn").instance()
		aura.position = Vector2(1, 20);
		aura.set(cType, 8);
		if cType == 1:
			aura.add_to_group("AuraRed")
		elif cType == 2:
			aura.add_to_group("AuraBlue")
		add_child(aura)

func _physics_process(delta):
	velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
