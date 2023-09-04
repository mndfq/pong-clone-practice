extends KinematicBody2D
var SPEED = 500
var velocity = Vector2.ZERO
func _ready():
	randomize()
	velocity.x = [-1.4, 1][randi() % 2]
	velocity.y = [-1, 1.5][randi() % 2]
func _physics_process(delta):
	var collision_obj = move_and_collide(velocity * SPEED * delta)
	if collision_obj:
		velocity = velocity.bounce(collision_obj.normal)
		$AudioStreamPlayer.playing = true
func stop_ball():
	SPEED = 0
func ball_reset():
	SPEED = 420
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-1.6, 1.5][randi() % 2]
