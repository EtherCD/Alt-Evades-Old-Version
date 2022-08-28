extends Node

export var id = -1
export var version = "0.6.5 (Pre-Alpha)"
export var gameName = ""

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
