extends Node

signal score_updated
signal player_died

var score := 0 setget set_score
var deaths := 0

func set_score(value: int):
	score = value
	emit_signal("score_updated")
