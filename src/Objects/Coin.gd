extends Area2D

#score
export var score := 20

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

#fading out animation when player touches the coin
func _on_body_entered(body: PhysicsBody2D) -> void:
	PlayerData.score += score
	anim_player.play("fade_out")
