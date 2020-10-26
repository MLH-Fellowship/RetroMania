extends "res://src/Actor.gd"

#track enemy direction
var direction = 1
var new_velocity = Vector2()
var new_speed = 30

#check if enemy is dead
var is_dead = false

# moving the enemy to the left, also deactivate physics process at the start of the game
func _ready():
	_velocity.x = -speed.x

# kills the enemy when fire ball hits it
func dead():
	is_dead = true
	new_velocity.x = 0
	queue_free()

# when the player hits the enemy to kill
func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()

# making the enemy move right when it hits something
func _physics_process(delta):
	if is_dead == false:
		_velocity.y = gravity * delta
		new_velocity.x = new_speed * direction
		#Enemy animation
		if direction == 1:
			$Enemy.flip_h = false
		else:
			$Enemy.flip_h = true
		$Enemy.play('walk')

		if is_on_wall():
			direction = direction * -1
			_velocity.x *= -1.0


	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
