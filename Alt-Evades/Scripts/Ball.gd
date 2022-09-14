extends KinematicBody2D

export var speed = 250
export var SAVE_TIME = 60
var alive = true
var timer_value = 60
export(int) var area = 1
export(int) var cEnergy = 30
export(int) var mEnergy = 30
export(int) var rEnergy = 1
export(int) var maxEnergy = 300
export(int) var maxRegen = 7
export(String) var heroName = "";
export(String) var nameAbility1 = "";
export(String) var nameAbility2 = "";
export(String) var Ability1Src = "";
export(String) var Ability2Src = "";

export(Color) var cColor = Color(0.2,0.2,0.2,1);
export(Color) var hCColor = Color(0.5,0.5,0.5,1);
export(String) var A1 = "";
export(String) var A2 = "";
export(String) var cLevel = "Evades Extracted"

var mPressed = false
var mMovement = false
var ability1 = false
var ability2 = false
var canUpgradeMaxEnergy = true
var canUpgradeRegen = true
var coef_rEnergy = 0.025
var cSpeed = 0
var shiftC = 1
var eCoefNot = 1
var inverseMethod=false
var cArea = 1;
var velocity = Vector2()
var saveZone = true

var AuraRed = false
var AuraBlue = false
var AuraPink = false

var target = Vector2()

func f_translate(bol):
	if bol: return "activated"
	return "not-activated"
	
func a_translate(bol):
	if bol: return "Yes"
	return "No ("+str(timer_value)+")"

func _ready():
	pass
	
func _all_ready():
	if heroName in Singletone.all_herous:
		$ColorSprite.modulate = Color(Singletone.hero_info[heroName]["HeroColor"]["r"], 
		Singletone.hero_info[heroName]["HeroColor"]["g"], 
		Singletone.hero_info[heroName]["HeroColor"]["b"],
		0.85)
	else:
		$ColorSprite.modulate = cColor
	get_node("Camera2D2/CenteredRect/ColorRect/Hero NLabel").text = heroName;
		
func _process(_delta):
	if cEnergy < mEnergy:
		cEnergy+=rEnergy*coef_rEnergy
	elif cEnergy > mEnergy:
		cEnergy = mEnergy;
	if cEnergy < 0:
		cEnergy = 0;
	if cEnergy > 0:
		cEnergy /= eCoefNot
	if not saveZone:
		if AuraRed:
			speed = cSpeed / 1.5
		elif speed <= cSpeed:
			speed = cSpeed
		if cSpeed < speed:
			cSpeed = speed
		if AuraBlue and cEnergy>0:
			cEnergy -= 0.25 * eCoefNot
	if mMovement:
		target = get_global_mouse_position()
	if ability1 and not AuraPink:
		ability1_f()
	if ability2 and not AuraPink:
		ability2_f()
	#if mMovement and mVelocity != velocity:
	#	mVelocity = velocity;
	draw_info()
	_add_process()

func _add_process():
	pass

func _boss_area():
	if cArea % 10 != 0:
		return " Boss "
	return " "

func draw_info():
	get_node("Camera2D2/ColorRect/Hero Info").text = "Speed: "+str(cSpeed/50)+"\nEnergy: "+str(int(cEnergy))+"/"+str(mEnergy)+"\nRegen: "+str(rEnergy)+"\nAlive:"+a_translate(alive)
	get_node("Camera2D2/Level Label").text = cLevel+":"+_boss_area()+"Area "+str(cArea)

func _physics_process(_delta):
	if alive:
		velocity = Vector2()
		if Input.is_action_pressed("ui_right") and not mMovement:
			velocity.x += 1
		if Input.is_action_pressed("ui_left") and not mMovement:
			velocity.x -= 1
		if Input.is_action_pressed("ui_down") and not mMovement:
			velocity.y += 1
		if Input.is_action_pressed("ui_up") and not mMovement:
			velocity.y -= 1
		if mMovement:
			velocity = global_position.direction_to(target)/2
			#speed /= mouseSpeed
			target -= global_position
			velocity /= (sqrt(target.x*target.x+target.y*target.y)/5)
			var direction_distance = target.length()*3
			if direction_distance == 0:
				direction_distance=1
			elif direction_distance < 0:
				direction_distance=1
			#print(direction_distance)
			if velocity.length() > 0:
				velocity = velocity.normalized() * (min(speed, direction_distance) / shiftC)
		else:
			if velocity.length() > 0:
				velocity = velocity.normalized() * (speed / shiftC)
		# warning-ignore:return_value_discarded
		move_and_slide(velocity)
		#get_node("src://Camera2D2").position=velocity
		#rpc_unreliable('_set_pos', velocity)
		#rpc_unreliable('_set_speed', speed)
		#rpc_unreliable('_set_time', timer_value)

func _input(event):
	if event is InputEventMouseButton && event.pressed == true:
		mMovement=not mMovement

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			Singletone.save_game()
			get_tree().quit()
		if event.pressed and event.scancode == KEY_1 and speed < 850:
			speed += 25;
		if event.pressed and event.scancode == KEY_2 and mEnergy < maxEnergy and canUpgradeMaxEnergy:
			mEnergy += 5;
		if event.pressed and event.scancode == KEY_3 and rEnergy < maxRegen and canUpgradeRegen:
			rEnergy += 0.2;
		if event.shift and shiftC == 1:
			shiftC = 2
		elif !event.shift and shiftC == 2:
			shiftC = 1;
		if not inverseMethod and alive:
			if event.pressed and event.scancode == KEY_Z and not ability2:
				ability1 = true;
			if event.pressed and event.scancode == KEY_Z and ability1:
				ability2 = false;
			if event.pressed and event.scancode == KEY_X and not ability2:
				ability2 = true;
			elif event.pressed and event.scancode == KEY_X and ability2:
				ability2 = false;
		elif alive and not AuraPink:
			if event.pressed and event.scancode == KEY_Z:
				ability1_f()
			if event.pressed and event.scancode == KEY_X:
				ability2_f()

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
	#if body.name == "AuraBlue" and not auraB:
	#	eCoefNot = 1.0000925
	#	auraB = true
	#elif body.name == "AuraBlue" and auraB:
	#	eCoefNot = 1
	#	auraB = false
	if body.name == "BallArea":
		revive()

func _on_DeathTimer_timeout():
	if timer_value > 0:
		timer_value -= 1
		$Label.text = str(timer_value)
