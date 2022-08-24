extends KinematicBody2D

func _ready():
	pass

func set(cType, size):
	self.scale = Vector2(size, size)
	if cType == 1:
		self.modulate = Color(1,0,0,0.3)
		$AuraArea.name = "AuraRed"
	if cType == 2:
		self.modulate = Color(0,0,1,0.3)
		$AuraArea.name = "AuraBlue"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
