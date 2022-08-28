extends Node2D

func _ready():
	pass

func _process(delta):
	$Label.rect_size.x = OS.get_window_size().x
	$CenteredRect.rect_size.x = OS.get_window_size().x
