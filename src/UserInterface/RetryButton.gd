extends Button


#on button press scene will change
func _on_PlayButton_button_up() ->void:
	#PlayerData.score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()
