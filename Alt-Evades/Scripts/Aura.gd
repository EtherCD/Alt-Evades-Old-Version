extends KinematicBody2D

var aType = 0;

func _ready():
	pass

func set(cType, size):
	self.scale = Vector2(size, size)
	aType = cType;
	if cType == 1:
		self.modulate = Color(1,0,0,0.3)
	if cType == 2:
		self.modulate = Color(0,0,1,0.3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AuraArea_body_entered(body):
	if body.name == "Player":
		if aType == 1:
			body.AuraRed=true
		elif aType == 2:
			body.AuraBlue=true


func _on_AuraArea_body_exited(body):
	if body.name == "Player":
		if aType == 1:
			body.AuraRed=false
		elif aType == 2:
			body.AuraBlue=false
