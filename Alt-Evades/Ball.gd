extends KinematicBody2D

export var speed = 250
export var SAVE_TIME = 60
var alive = true
var timer_value = 60
export var area = 1
export var cEnergy = 30
export var mEnergy = 30
export var rEnergy = 1
export var maxEnergy = 300
export var maxRegen = 7
export var heroName = "";
export var nameAbility1 = "";
export var nameAbility2 = "";

var mPressed = false
#var mMovement = true

var ability1 = false;
var ability2 = false;

var coef_rEnergy = 0.05;

var cSpeed = 0;
var shiftP = false;
var uShiftP = false;

var eCoefNot = 1

#var mVelocity = Vector2()
var velocity = Vector2()

func f_translate(bol):
	if bol: return "activated"
	else: return "not-activated"
	
func _ready():
	pass
		
func _process(_delta):
	if cEnergy < mEnergy:
		cEnergy+=rEnergy*coef_rEnergy
	elif cEnergy > mEnergy:
		cEnergy = mEnergy;
	if cEnergy < 0:
		cEnergy = 0;
	if cEnergy > 0:
		cEnergy /= eCoefNot
	if shiftP:
		speed = cSpeed / 2
	if uShiftP:
		speed = cSpeed / 2
	elif speed <= cSpeed:
		speed = cSpeed
	if cSpeed < speed:
		cSpeed = speed
	if ability1:
		ability1_f()
	if ability2:
		ability2_f()
	#if mMovement and mVelocity != velocity:
	#	mVelocity = velocity;
	get_node("ColorRect/Hero Info").text = "Speed: "+str(cSpeed/50)+"\nEnergy: "+str(int(cEnergy))+"/"+str(mEnergy)+"\nRegen: "+str(rEnergy)
	get_node("ColorRect/Hero Ability").text = 'Ability "'+nameAbility1+'":\n'+f_translate(ability1)+'\nAbility "'+nameAbility2+'":\n'+f_translate(ability2)
	
func _physics_process(_delta):
	if alive:
		velocity = Vector2()
		if Input.is_action_pressed("ui_right"): #and not mMovement:
			velocity.x += 1
		if Input.is_action_pressed("ui_left"): #and not mMovement:
			velocity.x -= 1
		if Input.is_action_pressed("ui_down"): #and not mMovement:
			velocity.y += 1
		if Input.is_action_pressed("ui_up"): #and not mMovement:
			velocity.y -= 1
		#if mMovement:
		#	velocity = mVelocity;
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
		# warning-ignore:return_value_discarded
		move_and_slide(velocity) 

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()
		if event.pressed and event.scancode == KEY_1 and speed < 850:
			speed += 50;
		if event.pressed and event.scancode == KEY_2 and mEnergy < maxEnergy:
			mEnergy += 5;
		if event.pressed and event.scancode == KEY_3 and rEnergy < maxRegen:
			rEnergy += 0.2;
		if event.shift and not shiftP:
			shiftP = true;
		elif shiftP and cSpeed > speed:
			shiftP = false;
		if event.pressed and event.scancode == KEY_Z and not ability1:
			ability1 = true;
		elif event.pressed and event.scancode == KEY_Z and ability1:
			ability1 = false;
		if event.pressed and event.scancode == KEY_X and not alive and cEnergy >= 100:
			ability2 = true;
		elif event.pressed and event.scancode == KEY_X and alive or cEnergy < 100:
			ability2 = false;
		#if event.pressed and event.scancode == KEY_X and not ability2:
		#	ability2 = true;
		#elif event.pressed and event.scancode == KEY_X and ability2:
		#	ability2 = false;

#func _input(event):
#	if event is InputEventMouseMotion:
#		if mMovement:
#			mVelocity = event.position * 500;

func ability1_f():
	pass
	
func ability2_f():
	pass

func kill():
	if alive: # and not ability1
		alive = false;
		$Label.text = str(SAVE_TIME)
		timer_value = SAVE_TIME
		$Label.visible = true
		$CollisionShape2D.set_deferred("disabled", true)
		#$BallArea/CollisionShape2D.set_deferred("disabled", true)
		$Sprite.modulate.a = 0.5
		$DeathTimer.start()
	#if ability1 and cEnergy > 7:
	#	cEnergy-=eAbility1_;
	#else:
	#	ability1 = false;

func revive():
		if !alive:
			alive = true;
			$Label.visible = false
			$CollisionShape2D.set_deferred("disabled", false)
			#$BallArea/CollisionShape2D.set_deferred("disabled", false)
			$Sprite.modulate.a = 1
			$DeathTimer.stop()

var auraR = false
var auraB = false

func hit(body):
	if body.name == "Enemy":
		kill()
	if body.name == "AuraRed" and not auraR:
		uShiftP = true
		auraR = true
	elif body.name == "AuraRed" and auraR:
		uShiftP = false
		auraR = false
	if body.name == "AuraBlue" and not auraB:
		eCoefNot = 1.0000925
		auraB = true
	elif body.name == "AuraBlue" and auraB:
		eCoefNot = 1
		auraB = false
	if body.name == "BallArea":
		revive()
	
func _on_DeathTimer_timeout():
	if timer_value > 0:
		timer_value -= 1
		$Label.text = str(timer_value)
