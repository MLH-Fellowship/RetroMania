extends Node


var world_sound = load("res://assets/Audio/word1-2.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func play_music():
	$Music.stream = world_sound
	$Music.play()

func stop():
	$Music.stop()
