extends "res://src/Actor.gd"

# moving the enemy to the left, also deactivate physics process at the start of the game
func _ready():
	set_physics_process(false)
	_velocity.x = -speed.x

# when the player hits the enemy to kill
func _on_StompDetecter_body_entered(body):
	if body.global_position.y > get_node("StompDetecter").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()

# making the enemy move right when it hits something
func _physics_process(delta):
	_velocity.y = gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


