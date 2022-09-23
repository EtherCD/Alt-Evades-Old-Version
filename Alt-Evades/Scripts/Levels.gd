extends Node2D

export(int) var col = 6;

export(int)  var customID = 1;
export(int) var modLevel = 2;
export(String) var levelName = "";

var evp_count = 0;
var win_text = "";
var end_area = 40;

var area = 2;
var notCustomID = 0;

func _ready():
	pass

func _on_Right_body_entered(body):
	if body.name == "Player":
		if notCustomID < $Teleport.id:
			notCustomID = $Teleport.id
		if area == end_area:
			customID=2
			$Teleport.is_win=true
			$Teleport.end_level=end_area
			$Teleport.win_text = win_text
			$Teleport.win_evp = evp_count
		if area == end_area-1 or area == end_area+1:
			$Teleport.is_win=false
			customID=1
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
	#area = Singletone.LevelArea
	$Generator._remove()
	
	$Generator.standartGenerator=false
	if levelName in Maps.maps:
		for level in Maps.maps[levelName]["Levels"]:
			if int(level) <= area and int(Maps.maps[levelName]["Levels"][level]["EndLevel"]) > area:
				var lev = Maps.maps[levelName]["Levels"][level]
				if lev["AreaModifi"]:
					$Generator.col=lev["Count"]+int(area/lev["AreaCoef"])
				else:
					$Generator.col=lev["Count"]
				for enemy in lev["Enemy"]:
					var cEnemy = enemy
					if cEnemy["AreaModifi"] and cEnemy["MSize"]!=0:
						$Generator._add(cEnemy["Type"],cEnemy["StandartSize"]+(area*cEnemy["MSize"]),cEnemy["Count"]+int(area/enemy["AreaCoef"]))
					elif cEnemy["MSize"]!=0:
						$Generator._add(cEnemy["Type"],cEnemy["StandartSize"]+(area*cEnemy["MSize"]),cEnemy["Count"])
					else:
						$Generator._add(cEnemy["Type"],cEnemy["StandartSize"],cEnemy["Count"])
				break
		if Maps.maps[levelName]["EVPGived"] != evp_count\
			and Maps.maps[levelName]["WinText"] != win_text\
			and Maps.maps[levelName]["WinLevel"] != end_area:
			evp_count = Maps.maps[levelName]["EVPGived"]
			win_text = Maps.maps[levelName]["WinText"]
			end_area = Maps.maps[levelName]["WinLevel"]
	
	if area < 1:
		$Generator.standartGenerator=true;
		$Generator.col=col;
		$Generator.size=0.45;
	#if area > 1 and area <= 9:
	#	$Generator.col=col+area
	#	#$Generator.auraSize=standartSizeAuras+(mSizeAuras * area)
	#	$Generator.standartGenerator=false;
	#	$Generator._add(4,standartSize+(area*mSize),0)
	#	$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+area)
	#if area == 10:
	#	$Generator._add(4,standartSize+(area*mSize),0)
	#	$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+area)
	#	$Generator._add(4,1.5,4)
	#if area >= 11 and area <= 19:
	#	$Generator.col=col+int(area/2)
	#	#$Generator._add(5,2.5,4)
	#	standartSize=(area*mSize)/2
	#	$Generator._add(4,standartSize+(area*mSize),0)
	#	$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2))
	#	$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2))
	#if area == 20:
	#	$Generator._add(4,standartSize+(area*mSize),0)
	#	$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2))
	#	$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2))
	#	$Generator._add(1,1.5,4)
	#if area >= 21 and area <= 29:
	#	$Generator.col=col+int(area/2.5)
	#	$Generator._add(4,standartSize+(area*mSize),0)
	#	$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
	#	$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
	#	$Generator._add(3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
	#if area == 30:
	#	$Generator._add(4,standartSize+(area*mSize),0)
	#	$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
	#	$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
	#	$Generator._add(3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/2.5))
	#	$Generator._add(2,1.5,4)
	#if area >= 31 and area <= 39:
	#	$Generator.col=col+int(area/3)
	#	$Generator._add(4,standartSize+(area*mSize),0)
	#	$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
	#	$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
	#	$Generator._add(3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
	#if area == 40:
	#	$Generator._add(4,standartSize+(area*mSize),0)
	#	$Generator._add(1,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
	#	$Generator._add(2,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
	#	$Generator._add(3,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
	#	$Generator._add(0,standartSizeEnemyAuras+(mSizeEnemyAuras*mSize),4+int(area/3))
	#	$Generator._add(3,1.5,4)
	
	print("Do: ", $Generator.arr_s)
	$Generator._create()
	print("Posle: ", $Generator.arr_s)

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
