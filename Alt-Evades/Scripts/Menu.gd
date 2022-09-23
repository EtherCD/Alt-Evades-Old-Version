extends Node2D

export(String) var ip = "127.0.0.1"
export(int) var port = 4545
export(int) var maxPlayer = 2;

func check_ip():
	var ip_e = $"ColorRect/Single Button2/IP".text
	var port_e = $"ColorRect/Single Button2/Port".text
	if ip_e != "" or ip_e != "127.0.0.1"\
		and port_e != "" or port_e != "50000":
		return [ip_e, int(port_e)]
	return [ip, port]

func _ready():
	Singletone.load_game()
	get_tree().connect("network_peer_connected", self, "_connected")
	get_node("Label2").text = "Version: "+Singletone.version
	$"ColorRect/Single Button/nameLine".text=Singletone.gameName
	$"ColorRect/Single Button2/IP".text=Singletone.ip
	$"ColorRect/Single Button2/Port".text=str(Singletone.port)

func _process(delta):
	#Mashtab fix
	$Label.rect_size.x = OS.get_window_size().x
	$Label2.rect_size.x = OS.get_window_size().x
	$Label2.rect_size.y = -OS.get_window_size().y
	$ColorRect.rect_size.x = OS.get_window_size().x

func _on_Single_Button_pressed():
	Singletone.gameName = get_node("ColorRect/Single Button/nameLine").text
	var game = preload("res://ChangeHero.tscn")
	get_tree().change_scene_to(game)
	hide()
	
func _on_ClientButton_pressed():
	Singletone.gameName = get_node("ColorRect/Single Button/nameLine").text
	var Ip = check_ip()
	Singletone.ip=Ip[0]
	Singletone.port=Ip[1]
	Singletone.serverConnection=true;
	var game = preload("res://ChangeHero.tscn")
	get_tree().change_scene_to(game)
	hide()
