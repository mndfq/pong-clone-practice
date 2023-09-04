extends Node

var pscore = 0
var p2score = 0
func _ready():
	p2score -= 2
	pscore -= 2
	#for some reason everytime the game starts it adds 2 points to each player so i found the temp solution :P 
func _on_left_body_entered(body):
	$ball.position = Vector2(640,360)
	p2score += 1
	$Timer.start()
	get_tree().call_group('ballgroup', 'stop_ball')

func _on_right_body_entered(body):
	$ball.position = Vector2(640,360)
	pscore += 1
	get_tree().call_group('ballgroup', 'stop_ball')
	$Timer.start()
func _process(delta):
	$Label.text = str(pscore)
	$Label2.text = str(p2score)
	if Input.is_action_pressed("esc"):
		get_tree().change_scene("res://scenes/title.tscn")
		queue_free()
	else: 
		pass
	if p2score == 10:
		$AcceptDialog.visible = true
		$AcceptDialog.dialog_text = str("You Lose!")
		$Timer.stop()
		get_tree().call_group('ballgroup', 'stop_ball')
	elif pscore == 10:
		$AcceptDialog.visible = true
		$AcceptDialog.dialog_text = str("You Win!")
		$Timer.stop()
		get_tree().call_group('ballgroup', 'stop_ball')
	else:
		pass


func _on_Timer_timeout():
	get_tree().call_group('ballgroup', 'ball_reset')


func _on_AcceptDialog_confirmed():
		get_tree().change_scene("res://scenes/title.tscn")
		queue_free()
