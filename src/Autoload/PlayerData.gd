extends Node

#setting signals for score and player death count
signal score_updated
signal player_died

#player score and deaths
var score := 0 setget set_score
var deaths := 0 setget set_deaths

#setting score of player
func set_score(value: int):
	score = value
	emit_signal("score_updated")

#setting deaths of player
func  set_deaths(value: int):
	deaths = value
	emit_signal("player_died")
	player_dead()

#resetting score and deaths
func reset():
	score = 0
	deaths = 0

#checks if player dies
func player_dead():
	if deaths == 3:
		get_tree().change_scene("res://src/Screens/EndScreen.tscn")
