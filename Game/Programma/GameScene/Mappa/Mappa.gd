extends Node

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	$TextureRect/Button1/Label.visible = false
	$TextureRect/Button2/Label.visible = false
	$TextureRect/Button3/Label.visible = false
	$TextureRect/Button4/Label.visible = false


func _on_Button1_pressed():	
	Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	SceneTransition.change_scene("res://GameScene/Game/Game.tscn")
	pass # Replace with function body.


func _mouse_entered_1():
	Input.set_custom_mouse_cursor(GlobalVariable.mouse_iter)
	$TextureRect/Button1/Label.visible = true
	pass # Replace with function body.

func _mouse_exited():
	Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	$TextureRect/Button1/Label.visible = false
	$TextureRect/Button2/Label.visible = false
	$TextureRect/Button3/Label.visible = false
	$TextureRect/Button4/Label.visible = false
	pass # Replace with function body.


func _mouse_entered_2():
	$TextureRect/Button2/Label.visible = true
	pass # Replace with function body.


func _mouse_entered_3():
	$TextureRect/Button3/Label.visible = true
	pass # Replace with function body.


func _mouse_entered_4():
	$TextureRect/Button4/Label.visible = true
	pass # Replace with function body.
