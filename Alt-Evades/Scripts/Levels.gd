extends Node2D

export(int) var col = 10;

export(int)  var customID = 1;

export(int) var cLevelStandart = 2;
export(int) var cLevelDark = 2;
export(int) var cLevelBlue = 2;
export(int) var cLevelRed  = 2;
export(int) var cLevelPink = 2;

export(int) var mLevelStandart = 40;
export(int) var mLevelDark = 40;
export(int) var mLevelBlue = 40;
export(int) var mLevelRed  = 40;
export(int) var mLevelPink = 40;

export(int) var modLevel = 2;

export(float) var standartSize = 0.45;
export(float) var mSize = 0.025;
#export(float) var maxSize = 1.5;

export(float) var standartSizeAuras = 1.45;
export(float) var mSizeAuras = 0.025;
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

func _gener():
	$Generator._remove()
	$Generator.size=standartSize+(mSize * area)
	$Generator.auraSize=standartSizeAuras+(mSizeAuras * area)
		
	if area >= cLevelStandart and area <= mLevelStandart:
		$Generator.standart=true
	else:
		$Generator.standart=false
		
	if area >= cLevelDark and area <= mLevelDark:
		$Generator.dark=true
	else:
		$Generator.dark=false
		
	if area >= cLevelRed and area <= mLevelRed:
		$Generator.red=true
	else:
		$Generator.red=false
			
	if area >= cLevelBlue and area <= mLevelBlue:
		$Generator.blue=true
	else:
		$Generator.blue=false
		
	if area >= cLevelPink and area <= mLevelPink:
		$Generator.pink=true
	else:
		$Generator.pink=false
		
	$Generator.col=col+(modLevel*area)
		
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
