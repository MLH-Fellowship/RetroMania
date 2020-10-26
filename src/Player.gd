extends "res://src/Actor.gd"

#Physics values (pixels per second)
const MOVE_SPEED = 500
const JUMP_FORCE = 1000
const GRAVITY = 50
const MAX_FALL_SPEED = 1000

#load firebal scene
const FIREBALL = preload("res://src/Fireball.tscn")


#directional values
var y_velo = 0
var facing_right = false

#Input processing
func _physics_process(delta):
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir +=1
	if Input.is_action_pressed("move_left"):
		move_dir -=1

	#for hold to fire
	if Input.is_action_just_pressed("shoot"):
		var fireball = FIREBALL.instance()
		get_parent().add_child(fireball)

		#get position2D so fireball fires from player
		fireball.position = $Position2D.global_position
	move_and_slide(Vector2(move_dir* MOVE_SPEED, y_velo),Vector2(0, -1))

	#check if player is on ground
	var grounded = is_on_floor()
	y_velo += GRAVITY
	#prevent jump if jump is already active
	if grounded and Input.is_action_just_pressed("jump"):
		y_velo = -JUMP_FORCE
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED

	#animations that will run based on input
	if grounded:
		if move_dir == 0:
			$AnimatedSprite.play("idle")
		else:
			$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("jump")

# kill the player if it touches the enemy
func _on_EnemyDetector_body_entered(body):
	queue_free()
