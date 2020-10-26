extends Control

onready var scene_tree:  = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score : Label = get_node("Label")

var paused = false setget set_paused

#connects to the score in the Player Data
func _ready():
	PlayerData.connect("score_updated", self, "update_interface")
	update_interface()

#if paused has been selected prevent any other inputs from running
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

#updates score on the screen
func update_interface():
	score.text = "Score: %s" % PlayerData.score
	
#pauses the game
func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	
