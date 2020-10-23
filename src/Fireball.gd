extends Area2D

const SPEED = 100
const velocity = Vector2()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = SPEED * delta
	translate(velocity)
	$AnimatedSprite.play("shoot")

#Clear fireball from memory once its off screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

#check if fireball hits wall (make it disappear)
func _on_Fireball_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
	queue_free()
