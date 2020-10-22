extends KinematicBody2D

#Physics values (pixels per second)
const MOVE_SPEED = 500
const JUMP_FORCE = 1000
const GRAVITY = 50
const MAX_FALL_SPEED = 1000

#references to animation player and sprite
onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite

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
	
	#refer to flip() method
	#if facing_right and move_dir < 0:
		#flip()
	#if !facing_right and move_dir > 0:
		#flip()
	
	#animations that will run based on input
	if grounded:
		if move_dir == 0:
			$AnimatedSprite.play("idle")
		else:
			$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("jump")
		
#if character has 2 directions they can face
#func flip():
#	facing_right = !facing_right
#	sprite.flip_h = !sprite.flip_h

		

#check the current running animation/state and trigger correct one
func play_anim(anim_name):
	if anim_player.is_playing() and anim_player.current_animation == anim_name:
		return
	anim_player.play(anim_name)
