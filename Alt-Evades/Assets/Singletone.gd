extends Node

export var id = -1
export var version = "0.7 (Alpha)"
export var gameName = "Player"

var extraVP = 0

var all_herous = [
	"Batt"
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
	}
}

func _ready():
	pass

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return
	save_game.open("user://savegame.save", File.READ)
	var data = parse_json(save_game.get_line())
	current_herous=data[0]
	extraVP=data[1]
	gameName=data[2]
	
	save_game.close()

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json([current_herous, extraVP,gameName]))
	save_game.close()
