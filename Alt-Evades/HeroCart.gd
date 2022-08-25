extends ColorRect

export(String) var HeroName = "";
export(String) var A1 = "";
export(String) var A2 = "";
export(String) var HeroLink = ""

func _ready():
	get_node("Hero Name").text = HeroName
	get_node("A1").text = A1
	get_node("A2").text = A2

func _on_Button_pressed():
	var game = preload("res://Main.tscn").instance()
	game.chLink = HeroLink
	get_tree().get_root().add_child(game)
	hide()
