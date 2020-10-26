#allows code to be run in editor
tool
extends Button


#get scene dynamically
export(String, FILE) var next_scene_path = ""

#on button press scene will change
func _on_PlayButton_button_up():
	get_tree().change_scene(next_scene_path)
	get_tree().paused = false

#Error handling
func _get_configuration_warning() -> String:
	return "next_scene_path must be set for button to work" if next_scene_path == "" else ""
