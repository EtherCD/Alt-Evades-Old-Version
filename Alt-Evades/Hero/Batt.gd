extends "res://Scripts/Ball.gd"

var eAbility1 = 10;
var eAbility1_ = 50;
var switcher;
var Regen = 0;

func _ready():
	heroName = "Batt"
	if heroName in Singletone.all_herous:
		nameAbility1 = Singletone.hero_info[heroName]["NameAbility1"]
		nameAbility2 = Singletone.hero_info[heroName]["NameAbility2"]
		Ability1Src = Singletone.hero_info[heroName]["Resources"]["Ability1"];
		Ability2Src = Singletone.hero_info[heroName]["Resources"]["Ability2"];		
	$Camera2D2/CenteredRect/ColorRect/ColorRect/Ability1.text = nameAbility1;
	$Camera2D2/CenteredRect/ColorRect/ColorRect/Ability2.text = nameAbility2;
	var res1 = load("res://Assets/icons/"+Ability1Src)
	var res2 = load("res://Assets/icons/"+Ability2Src)
	$Camera2D2/CenteredRect/ColorRect/ColorRect/ability1.texture = res1;
	$Camera2D2/CenteredRect/ColorRect/ColorRect/ability2.texture = res2;
		
	maxEnergy = 500
	inverseMethod = true
	get_node("Name").text = Singletone.gameName;
	_all_ready()

func draw_info():
	if not alive:
		rEnergy = Regen;
	get_node("Camera2D2/CenteredRect/ColorRect/Hero Info").text = "Speed: "+str(cSpeed/50)+"\nEnergy: "+str(int(cEnergy))+"/"+str(mEnergy)+"\nRegen: "+str(rEnergy)+"\nAlive:"+a_translate(alive)
	#get_node("Camera2D2/ColorRect/Hero Ability").text = 'Ability "'+nameAbility1+'":\n'+f_translate(switcher)+'\nAbility "'+nameAbility2+'":\n passive'
	if not switcher:
		$Camera2D2/CenteredRect/ColorRect/ColorRect/ability1.modulate = Color(1,1,1,1)
	else: $Camera2D2/CenteredRect/ColorRect/ColorRect/ability1.modulate = Color(1,1,1,0.45)
	get_node("EnergyBar").value = (cEnergy / mEnergy) * 100
	
	get_node("Camera2D2/Level Label").text = cLevel+": Area "+str(cArea)
	
	$Camera2D2/CenteredRect.rect_size.x = OS.get_window_size().x*1.225
	$Camera2D2/CenteredRect.rect_size.y = OS.get_window_size().y*1.205
	get_node("Camera2D2/Level Label").rect_position.y = -OS.get_window_size().y*1.225
	#$Camera2D2.zoom.x = 2/(OS.get_window_size().x/540)
	#$Camera2D2.zoom.y = 2/(OS.get_window_size().y/360)

#Ability
func ability1_f():
	if rEnergy > 2:
		if switcher and cEnergy > 1:
			cEnergy -= eAbility1*coef_rEnergy;
		elif switcher and cEnergy < 1:
			switcher = false;
		switcher = not switcher
		canUpgradeRegen=not switcher
		$Dome.visible=switcher
		if switcher:
			Regen = rEnergy
			rEnergy = Regen / 2;
		else:
			rEnergy = Regen;
	
func ability2_f():
	pass

#Func kill
func kill():
	if alive and not switcher:
		alive = false;
		$Label.text = str(SAVE_TIME)
		timer_value = SAVE_TIME
		$Label.visible = true
		$CollisionShape2D.set_deferred("disabled", true)
		#$BallArea/CollisionShape2D.set_deferred("disabled", true)
		$Sprite.modulate.a = 0.5
		$DeathTimer.start()
		$Dome.visible=false
	if switcher and cEnergy > 10:
		cEnergy-=eAbility1_*0.5;
	else:
		switcher = false;
