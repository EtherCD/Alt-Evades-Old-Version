extends KinematicBody2D

export(int) var speed = 400 
export(int) var SAVE_TIME = 60
var alive = true
var timer_value = 60;
var velocity = Vector2()
var velocity2 = Vector2()
var named = "Player"
var energy = 0
var color = Color(0,0,0,0)

remote func _set_pos(vec: Vector2):
	velocity2 = vec;

remote func _set_name(name2):
	named=name2

remote func _set_energy(energy2):
	energy=energy2

remote func _set_color(colored:Color):
	color=colored

func _ready():
	$Name.text=named
	self.modulate=color

func _process(delta):
	$EnergyBar.value = energy

func _physics_process(_delta):
	var space_state = get_world_2d().direct_space_state
	var result
	var max_vector = Vector2(0, 0)
	var vector = Vector2(0, 0)
	if alive:
		velocity = velocity2.normalized() * speed
		move_and_slide(velocity)
	
func kill():
	if alive:
		alive = false;
		$Label.text = str(SAVE_TIME)
		timer_value = SAVE_TIME
		$Label.visible = true
		$CollisionShape2D.set_deferred("disabled", true)
		#$BallArea/CollisionShape2D.set_deferred("disabled", true)
		$Sprite.modulate.a = 0.5
		$DeathTimer.start()

func revive():
		if !alive:
			alive = true;
			$Label.visible = false
			$CollisionShape2D.set_deferred("disabled", false)
			#$BallArea/CollisionShape2D.set_deferred("disabled", false)
			$Sprite.modulate.a = 1
			$DeathTimer.stop()

func hit(body):
	print(body.name)
	if body.name == "Enemy":
		kill()
	elif body.name == "BallArea":
		revive()
	
func _on_DeathTimer_timeout():
	if timer_value > 0:
		timer_value -= 1
		$Label.text = str(timer_value)
