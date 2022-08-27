extends "res://Scripts/Ball.gd"

var eAbility1 = 2;
var eAbility1_ = 15;
var eAbility2 = 100;

func _ready():
	heroName = "Standart"
	nameAbility1 = "Foreignness"
	nameAbility2 = "Second Life"
	A1 = "Foreigness:2 energy per second. if in a ball then 6 energy per second"
	A2 = "Second Life Geves a second life for 100 energy"
	get_node("Camera2D2/ColorRect/Hero NLabel").text = heroName;


#Ability
func ability1_f():
	if ability1 and cEnergy > 1:
		cEnergy -= eAbility1*coef_rEnergy;
	elif ability1 and cEnergy < 1:
		ability1 = false;
	
func ability2_f():
	cEnergy -= eAbility2;
	revive()

#Func kill
func kill():
	if alive and not ability1:
		alive = false;
		$Label.text = str(SAVE_TIME)
		timer_value = SAVE_TIME
		$Label.visible = true
		$CollisionShape2D.set_deferred("disabled", true)
		#$BallArea/CollisionShape2D.set_deferred("disabled", true)
		$Sprite.modulate.a = 0.5
		$DeathTimer.start()
	if ability1 and cEnergy > 7:
		cEnergy-=eAbility1_;
	else:
		ability1 = false;
