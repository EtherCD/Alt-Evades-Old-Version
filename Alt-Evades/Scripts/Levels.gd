extends Node2D

export(int) var col = 6;

export(int)  var customID = 1;

export(int) var cLevelStandart = 2;
export(int) var cLevelDark = 2;
export(int) var cLevelBlue = 2;
export(int) var cLevelRed  = 2;
export(int) var cLevelPink = 2;
export(int) var cLevelHoney = 2;

export(int) var mLevelStandart = 40;
export(int) var mLevelDark = 40;
export(int) var mLevelBlue = 40;
export(int) var mLevelRed  = 40;
export(int) var mLevelPink = 40;
export(int) var mLevelHoney = 40;

export(int) var modLevel = 2;

export(float) var standartSize = 0.45;
export(float) var mSize = 0.025;
#export(float) var maxSize = 1.5;

export(float) var standartSizeEnemyAuras = 0.25;
export(float) var mSizeEnemyAuras = 0.005;
#export(float) var maxSizeAuras = 1.5;

var area = 2;
var notCustomID = 0;

func _ready():
	pass

func _process(delta):
	pass

func _on_Right_body_entered(body):
	if body.name == "Player":
		if notCustomID < $Teleport.id:
			notCustomID = $Teleport.id
		$Teleport.id = customID
###
#func _generet_s(generator,cLevel,mLevel,cType,cSize,col):
#	if area >= cLevel and area <= mLevel:generator._add(cType,cSize,col)

#func _standart_g(generator,cDark,cStandart,cRed,cBlue,cPink,cHoney):
#	_generet_s($Generator,cLevelDark,mLevelDark,0,standartSize+(area*mSize),cDark)
#	_generet_s($Generator,cLevelStandart,mLevelStandart,4,standartSize+(area*mSize),cStandart)
#	_generet_s($Generator,cLevelRed,mLevelRed,1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),cRed)
#	_generet_s($Generator,cLevelBlue,mLevelBlue,2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),cBlue)
#	_generet_s($Generator,cLevelPink,mLevelPink,3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),cPink)
#	_generet_s($Generator,cLevelHoney,mLevelHoney,5,standartSize+(area*mSize)-0.55,cHoney)
###
func _gener():
	$Generator._remove()
	
	
	if area < 1:
		$Generator.standartGenerator=true;
		$Generator.col=6;
		$Generator.size=0.45;
	if area > 1 and area <= 9:
		$Generator.col=col+area
		#$Generator.auraSize=standartSizeAuras+(mSizeAuras * area)
		$Generator.standartGenerator=false;
		$Generator._add(4,standartSize+(area*mSize),0)
		$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+area)
	if area == 10:
		$Generator._add(4,standartSize+(area*mSize),0)
		$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+area)
		$Generator._add(4,1.5,4)
	if area >= 11 and area <= 19:
		$Generator.col=col+int(area/2)
		#$Generator._add(5,2.5,4)
		standartSize=(area*mSize)/2
		$Generator._add(4,standartSize+(area*mSize),0)
		$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2))
		$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2))
	if area == 20:
		$Generator._add(4,standartSize+(area*mSize),0)
		$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2))
		$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2))
		$Generator._add(1,1.5,4)
	if area >= 21 and area <= 29:
		$Generator.col=col+int(area/2.5)
		$Generator._add(4,standartSize+(area*mSize),0)
		$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
		$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
		$Generator._add(3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
	if area == 30:
		$Generator._add(4,standartSize+(area*mSize),0)
		$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
		$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
		$Generator._add(3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
		$Generator._add(2,1.5,4)
	if area >= 31 and area <= 39:
		$Generator.col=col+int(area/3)
		$Generator._add(4,standartSize+(area*mSize),0)
		$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
		$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
		$Generator._add(3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
	if area == 40:
		$Generator._add(4,standartSize+(area*mSize),0)
		$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
		$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
		$Generator._add(3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
		$Generator._add(0,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
		$Generator._add(3,1.5,4)
	
	
	$Generator._create()

func _on_Detector_body_entered(body):
	if body.name == "Player":
		area+=1
		_gener()


func _on_Detector_right_entered(body):
	if body.name == "Player" and $Teleport.id != 0:
		area-=1
		_gener()


func _on_Left_body_entered(body):
	if body.name == "Player":
		if area == 1 or area == 2:
			$Teleport.id=0
