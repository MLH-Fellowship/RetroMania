extends Control


#TO be used for onscreen label updates
onready var label : Label = $Label

#replace %s with the score and deaths
func _ready()-> void:
	label.text = label.text % [PlayerData.score, PlayerData.deaths]
	
	
