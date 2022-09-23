extends Node

export var id = 1;
export var version = "0.7.2 (Alpha)"
export var gameName = "Player"

var LevelArea = 1

var serverConnection = false

export var ip = "127.0.0.1"
export var port = 50001

var _client = NetworkedMultiplayerENet.new()
var server_status = ""

var extraVP = 0

var chLink = ""

var all_herous = [
	"Batt",
	"Fluid"
]
var current_herous = [
	"Batt"
]
var hero_info = {
	"Batt": {
		"HeroColor": {
			"r": 0.816406,
			"g": 0.806827,
			"b": 0.203304
		},
		"HeroFone": [
			"#edffff5a",
			"#caca37",
			"#525200"
		],
		"A1": "Dome: Protects from everyone at the expense of energy 5 per activation, 10 per ball hit",
		"A2": "Mega Battery: Passive ability makes max storage up to 500",
		"NameAbility1": "Dome",
		"NameAbility2": "Mega Battery",
		"HeroLink": "Batt",
		"LevelToComplite": "Evades Extracted",
		"CurrentLevel": 0,
		"Resources": {
			"Ability1": "batt_dome.png",
			"Ability2": "batt_battery.png"
		}
	},
	"Fluid": {
		"HeroColor": {
			"r": 0.29,
			"g": 0.29,
			"b": 0.29
		},
		"HeroFone": [
			"#5a5aff",
			"#323295",
			"#0a0a0a"
		],
		"A1": "Quarantine zone: It is created at the place of manifestation of the character with a radius in cells of 5 in it, all enemies are delayed by 40% and do not become mortal without any obstacles.",
		"A2": "Jumper: shoots 6 balls that fly with a distance from the beginning of the map to the middle, they are 2 by 2 cells and can rebound from the sides of the end of the map and heal.",
		"NameAbility1": "Dome",
		"NameAbility2": "Mega Battery",
		"HeroLink": "Fluid",
		"LevelToComplite": "Evades Extracted",
		"CurrentLevel": 40,
		"Resources": {
			"Ability1": "batt_dome.png",
			"Ability2": "batt_battery.png"
		}
	}
}

#Server
func _ready():
	id=rand_range(1, 1000)

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return
	save_game.open("user://savegame.save", File.READ)
	var data = parse_json(save_game.get_line())
	current_herous=data[0]
	extraVP=data[1]
	gameName=data[2]
	
	if data[3]:
		ip=data[3]
		port=data[4]
	
	save_game.close()

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json([current_herous,extraVP,gameName,ip,port]))
	save_game.close()
