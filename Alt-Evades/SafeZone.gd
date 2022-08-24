extends StaticBody2D

export var xCoef = 200;

func _ready():
	pass

func _on_Area_12_input_event(viewport, event, shape_idx):
	event.position = Vector2(event.position.x+xCoef, event.position.y)
