extends "res://Ball.gd"

var eAbility1 = 10;
var eAbility1_ = 50;

var switcher;

var Regen = 0;

func _ready():
	heroName = "Batt"
	nameAbility1 = "Dome"
	nameAbility2 = "Mega Battary"
	maxEnergy = 500
	inverseMethod = true
	_all_ready()

func draw_info():
	get_node("Camera2D2/ColorRect/Hero Info").text = "Speed: "+str(cSpeed/50)+"\nEnergy: "+str(int(cEnergy))+"/"+str(mEnergy)+"\nRegen: "+str(rEnergy)
	get_node("Camera2D2/ColorRect/Hero Ability").text = 'Ability "'+nameAbility1+'":\n'+f_translate(switcher)+'\nAbility "'+nameAbility2+'":\n passive'
	get_node("EnergyBar").value = (cEnergy / mEnergy) * 100
	get_node("Name").text = Singletone.gameName;

#Ability
func ability1_f():
	if switcher and cEnergy > 1:
		cEnergy -= eAbility1*coef_rEnergy;
	elif switcher and cEnergy < 1:
		switcher = false;
	switcher = not switcher
	canUpgradeRegen=not switcher
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
	if switcher and cEnergy > 10:
		cEnergy-=eAbility1_*0.5;
	else:
		switcher = false;
