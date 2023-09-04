extends Control

const main_lvl = preload("res://scenes/Level.tscn")
func _on_Button2_pressed():
	get_tree().quit()


func _on_Button_pressed():
	get_parent().add_child(main_lvl.instance())
func you_lose():
	$VBoxContainer/Label.text = str("You Lose!")
func you_win():
	$VBoxContainer/Label.text = str("You Win!")
func reset():
	$VBoxContainer/Label.text = str("Reset!")
