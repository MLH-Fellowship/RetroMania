extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
#The packed scene type refers to any level (scene) file
export var next_scene: PackedScene

func _process(delta):
	$portal.play("portalwarp")
#When the nextLevel detects the player, teleport() will be called
func _on_NextLevel2D_body_entered(body : PhysicsBody2D) -> void:
	teleport()

#Error handling, check if scene is available
func _get_configuration_warning() -> String:
	return "The Next scene cant be empty" if not next_scene else ""

#When payer touches portal, play animation
func teleport() -> void:
	anim_player.play("FadeIn")
	#wait for task (animation to finish)
	yield(anim_player, "animation_finished")
	#change scene 
	#get.tree() gets all available scenes in project
	get_tree().change_scene_to(next_scene)



