extends Button

var ip = "127.0.0.1"
var port = 5894
var countPlayer = 2

func _ready():
	pass

func check_ip():
	var ip_e = $ipEdit.text
	if ip_e != "" or ip_e != "127.0.0.1":
		return ip_e
	return ip

func _on_ServerButton_pressed():
	var ip_e = check_ip();
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(ip_e, port)
	get_tree().network_peer=peer
	var changeHero = preload("res://ChangeHero.tscn").instance()
	add_child(changeHero)
	hide()

func _on_ClientButton_pressed():
	var ip_e = check_ip();
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip_e, port)
	get_tree().network_peer=peer
	var changeHero = preload("res://ChangeHero.tscn").instance()
	add_child(changeHero)
	hide()
