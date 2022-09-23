extends Node

#Use 4 inf type in end Enemy
var maps = {
	"Evades Extracted": {
		"Levels": { #Levels
			"1": {
				"Enemy": [
					{
						"Type": 1,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 1
					},
					{
						"Type": 4,
						"StandartSize": 0.45,
						"Count": 0,
						"MSize": 0.025,
						"AreaModifi": false,
						"AreaCoef": 0
					},
				],
				"Count": 6,
				"AreaModifi": true,
				"AreaCoef": 1,
				"EndLevel": 10
			},
			"10": {
				"Enemy": [
					{
						"Type": 4,
						"StandartSize": 1.5,
						"Count": 4,
						"MSize": 0,
						"AreaModifi": false,
						"AreaCoef": 0
					},
					{
						"Type": 1,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 1
					},
					{
						"Type": 4,
						"StandartSize": 0.45,
						"Count": 0,
						"MSize": 0.025,
						"AreaModifi": false,
						"AreaCoef": 0
					}
				],
				"Count": 6,
				"AreaModifi": true,
				"AreaCoef": 1,
				"EndLevel": 11
			},
			"11": {
				"Enemy": [
					{
						"Type": 1,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 2
					},
					{
						"Type": 2,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 2
					},
					{
						"Type": 4,
						"StandartSize": 0.45,
						"Count": 0,
						"MSize": 0.025,
						"AreaModifi": false,
						"AreaCoef": 0
					}
				],
				"Count": 6,
				"AreaModifi": true,
				"AreaCoef": 2,
				"EndLevel": 20
			},
			"20": {
				"Enemy": [
					{
						"Type": 1,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 2
					},
					{
						"Type": 1,
						"StandartSize": 1.5,
						"Count": 4,
						"MSize": 0,
						"AreaModifi": false,
						"AreaCoef": 0
					},
					{
						"Type": 2,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 2
					},
					{
						"Type": 4,
						"StandartSize": 0.45,
						"Count": 0,
						"MSize": 0.025,
						"AreaModifi": false,
						"AreaCoef": 0
					}
				],
				"Count": 6,
				"AreaModifi": true,
				"AreaCoef": 2,
				"EndLevel": 21
			},
			"21": {
				"Enemy": [
					{
						"Type": 1,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 2
					},
					{
						"Type": 2,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 2
					},
					{
						"Type": 3,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 2
					},
					{
						"Type": 4,
						"StandartSize": 0.45,
						"Count": 0,
						"MSize": 0.025,
						"AreaModifi": false,
						"AreaCoef": 0
					}
				],
				"Count": 6,
				"AreaModifi": true,
				"AreaCoef": 2.5,
				"EndLevel": 30
			},
			"30": {
				"Enemy": [
					{
						"Type": 1,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 3
					},
					{
						"Type": 2,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 3
					},
					{
						"Type": 2,
						"StandartSize": 1.25,
						"Count": 4,
						"MSize": 0,
						"AreaModifi": false,
						"AreaCoef": 0
					},
					{
						"Type": 2,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 3
					},
					{
						"Type": 4,
						"StandartSize": 0.45,
						"Count": 0,
						"MSize": 0.025,
						"AreaModifi": false,
						"AreaCoef": 0
					}
				],
				"Count": 6,
				"AreaModifi": true,
				"AreaCoef": 2.5,
				"EndLevel": 31
			},
			"31": {
				"Enemy": [
					{
						"Type": 1,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 3
					},
					{
						"Type": 2,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 3
					},
					{
						"Type": 3,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 3
					},
					{
						"Type": 4,
						"StandartSize": 0.45,
						"Count": 0,
						"MSize": 0.025,
						"AreaModifi": false,
						"AreaCoef": 0
					}
				],
				"Count": 6,
				"AreaModifi": true,
				"AreaCoef": 3,
				"EndLevel": 40
			},
			"40": {
				"Enemy": [
					{
						"Type": 1,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 4
					},
					{
						"Type": 2,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 4
					},
					{
						"Type": 3,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.005,
						"AreaModifi": true,
						"AreaCoef": 4
					},
					{
						"Type": 3,
						"StandartSize": 1.5,
						"Count": 4,
						"MSize": 0,
						"AreaModifi": false,
						"AreaCoef": 0
					},
					{
						"Type": 0,
						"StandartSize": 0.25,
						"Count": 4,
						"MSize": 0.025,
						"AreaModifi": true,
						"AreaCoef": 4
					},
					{
						"Type": 4,
						"StandartSize": 0.45,
						"Count": 0,
						"MSize": 0.025,
						"AreaModifi": false,
						"AreaCoef": 0
					}
				],
				"Count": 6,
				"AreaModifi": true,
				"AreaCoef": 3,
				"EndLevel": 41
			}
		},
		"EVPGived": 1,
		"WinText": "You Won!",
		"WinLevel": 40
	}
}

func _ready():
	pass
