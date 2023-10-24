extends Node

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	$Intro.visible = true
	
	$Vittoria.visible = false
	$Obiettivo.visible = false
	
	$TextureRect/Neon1.disabled = true
	$TextureRect/Neon2.disabled = true
	$TextureRect/Lampada.disabled = true
	$TextureRect/Lampadario.disabled = true
	$TextureRect/Lampadina1.disabled = true
	$TextureRect/Lampadina2.disabled = true


func _process(delta):
	# Per vincere
	if not $TextureRect/Neon1/Sprite.luce and not $TextureRect/Neon2/Sprite.luce and not $TextureRect/Lampada/Sprite.luce and not $TextureRect/Lampadario/Sprite.luce and not $TextureRect/Lampadina1/Sprite.luce and not $TextureRect/Lampadina2/Sprite.luce:
		$Obiettivo.visible = false
		$Vittoria.visible = true
		GlobalVariable.level1 = true


func _back():
	SceneTransition.change_scene("res://GameScene/Game/Game.tscn")
	pass # Replace with function body.


func _on_Button_pressed():
	$Obiettivo.visible = true
	$Intro.visible = false
	
	$TextureRect/Neon1.disabled = false
	$TextureRect/Neon2.disabled = false
	$TextureRect/Lampada.disabled = false
	$TextureRect/Lampadario.disabled = false
	$TextureRect/Lampadina1.disabled = false
	$TextureRect/Lampadina2.disabled = false
	
	Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	pass # Replace with function body.


# Cambio texture del mouse
func _mouse_entered():
	Input.set_custom_mouse_cursor(GlobalVariable.mouse_iter)
	pass # Replace with function body.


func _mouse_exited():
	Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	pass # Replace with function body.
