extends Node2D

export var ip = "127.0.0.1"
export var port = 5650
export var maxPlayer = 2;

func _ready():
	get_tree().connect("network_peer_connected", self, "_connected")
	get_node("Label2").text = "Version: "+Singletone.version

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
	Singletone.gameName = get_node("Single Button/nameLine").text
	var game = preload("res://ChangeHero.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()


func _on_Multi_Button_pressed():
	Singletone.gameName = get_node("Single Button/nameLine").text
	var game = preload("res://MultiPlayer.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
