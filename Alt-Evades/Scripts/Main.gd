extends Node

export(bool) var Debug = false
export(String) var chLink = ""

func _ready():
	randomize()
	# Make bot colored
	$PlayerContainer/Bot.modulate = Color(0, 1, 0, 1)
	
	# Make safe zone transluscent
	$LeftSafeZone/ColorRect.color[3] = 0.5
	$RightSafeZone/ColorRect.color[3] = 0.5
	
	#if not Singletone.id == 0:
	#	var player1 = preload("res://Player1.tscn").instance()
	#	player1.name = "Player"
	#	player1.set_network_master(get_tree().get_network_unique_id())
	#	player1.position = Vector2(rand_range(100, 250), rand_range(100, 250))
	#	add_child(player1)
	#	
	#	var player2 = preload("res://Player2.tscn").instance()
	##	player2.name = "Player2"
	#	player2.set_network_master(Singletone.id)
	#	player2.position = Vector2(rand_range(100, 250), rand_range(100, 250))
	#	add_child(player2)
	#elif Singletone.id == 0:
	if chLink == "Batt":
		var player_node = preload("res://hero/Batt.tscn").instance()
		player_node.name = "Player"
		player_node.set_network_master(get_tree().get_network_unique_id())
		player_node.set_position(Vector2(rand_range(100, 300), rand_range(100, 300)))
		add_child(player_node)
	
	#if 
	#	
	#get_node("PlayerContainer/Player/Camera2D2/Version Label").text = "Version: "+Singletone.version	
	
	# Idk why, but bot required specific exception with safezones
	# despite layer/mask data being identical to player
	var players  = $PlayerContainer.get_children()
	for player in players:
		player.add_collision_exception_with($LeftSafeZone)
		player.add_collision_exception_with($RightSafeZone)

func _process(_delta):
	if Debug:
		if !$PlayerContainer/Player.alive:
			if Input.is_key_pressed(KEY_R):
				$PlayerContainer/Player.revive()
				
func _physics_process(delta):
	pass
#	# Move bot
#	if $PlayerContainer/Bot0.alive:
#		$PlayerContainer/Bot0.velocity = $PlayerContainer/Player.velocity
#	else:
#		$PlayerContainer/Bot0.velocity = Vector2()
	
	# Use raycasting to determine path for bot
