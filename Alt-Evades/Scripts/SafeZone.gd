extends StaticBody2D


func _on_Detector_body_entered(body):
	if body.name == "Player":
		body.saveZone = true


func _on_Detector_body_exited(body):
	if body.name == "Player":
		body.saveZone = false
