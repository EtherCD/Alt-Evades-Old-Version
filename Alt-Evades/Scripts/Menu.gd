extends Node2D

export(String) var ip = "127.0.0.1"
export(int) var port = 5650
export(int) var maxPlayer = 2;

func _ready():
	Singletone.load_game()
	get_tree().connect("network_peer_connected", self, "_connected")
	get_node("Label2").text = "Version: "+Singletone.version
	$"ColorRect/Single Button/nameLine".text=Singletone.gameName

func _process(delta):
	#Mashtab fix
	$Label.rect_size.x = OS.get_window_size().x
	$Label2.rect_size.x = OS.get_window_size().x
	$Label2.rect_size.y = -OS.get_window_size().y
	$ColorRect.rect_size.x = OS.get_window_size().x

remote func _connected(c_id):
	Singletone.id = c_id
	var game = preload("res://Main.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()

func _on_SButton_pressed():
	var server = NetworkedMultiplayerENet.new()
	server.create_server(port, maxPlayer)
	get_tree().set_network_peer(server)

func _on_CButton_pressed():
	var client = NetworkedMultiplayerENet.new()
	client.create_client(ip, port)
	get_tree().set_network_peer(client)


func _on_Single_Button_pressed():
	Singletone.gameName = get_node("ColorRect/Single Button/nameLine").text
	var game = preload("res://ChangeHero.tscn")
	get_tree().change_scene_to(game)
	hide()


func _on_Multi_Button_pressed():
	Singletone.gameName = get_node("Single Button/nameLine").text
	var game = preload("res://MultiPlayer.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
