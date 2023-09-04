extends KinematicBody2D

export(int) var SPEED = 630
var ball

func _ready():
	ball = get_parent().find_node("ball")

func _physics_process(delta):
	move_and_slide(Vector2(0, p2_pos()) * SPEED)
	

func p2_pos():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
