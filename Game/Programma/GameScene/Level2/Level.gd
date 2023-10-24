extends Node

var num = 0

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	$Intro.visible = true
	
	$Vittoria.visible = false
	$Obiettivo.visible = false
	
	$TextureRect/Water.disabled = true
	$TextureRect/Armadietto.disabled = true
	$TextureRect/Papera.disabled = true
	$TextureRect/Finestra.disabled = true
	$TextureRect/Lavandino.disabled = true
	$TextureRect/Secchio.disabled = true
	
	$TextureRect/Sfondo_cassetta.visible = false
	$TextureRect/Sfondo_chiave.visible = false
	$TextureRect/Sfondo_secchio.visible = false
	$TextureRect/Sfondo_frammenti.visible = false
	

func _process(delta):
	# Per vincere
	if GlobalVariable.rottura == 4 and GlobalVariable.pianta == 3:
		$Obiettivo.visible = false
		$Vittoria.visible = true
		GlobalVariable.level2 = true
	
	# Controllo
	if GlobalVariable.chiave_inglese == 1 and $TextureRect/Lavandino/Sprite.aggiustato == 1:
		$TextureRect/Sfondo_chiave.visible = false
		GlobalVariable.chiave_inglese = 0
		Input.set_custom_mouse_cursor(GlobalVariable.mouse_iter)
		
	if GlobalVariable.secchio == 1 and GlobalVariable.pianta == 3:
		$TextureRect/Sfondo_secchio.visible = false
		GlobalVariable.pieno = 2
		$TextureRect/Secchio.visible = true
	
	if GlobalVariable.rottura == 4:
		$Obiettivo.visible = true
		$TextureRect/Sfondo_frammenti.visible = false
		$TextureRect/Lavandino/Sprite.set_texture(preload("res://GameScene/Level2/img/Lavandino/Lavandino.png"))
		if num == 0:
			Input.set_custom_mouse_cursor(GlobalVariable.mouse)
			num = 1


func _back():
	SceneTransition.change_scene("res://GameScene/Game/Game.tscn")
	pass # Replace with function body.


func _on_Button_pressed():
	$Obiettivo.visible = true
	$Intro.visible = false
	
	$TextureRect/Water.disabled = false
	$TextureRect/Armadietto.disabled = false
	$TextureRect/Papera.disabled = false
	$TextureRect/Finestra.disabled = false
	$TextureRect/Lavandino.disabled = false
	$TextureRect/Secchio.disabled = false
	
	Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	pass # Replace with function body.


func _on_Cassetta_Armadio_pressed():
	$Obiettivo.visible = false
	$TextureRect/Sfondo_cassetta.visible = true
	pass # Replace with function body.


func _on_Esci_pressed():
	$Obiettivo.visible = true
	$TextureRect/Sfondo_cassetta.visible = false
	pass # Replace with function body.


# Cambio texture del mouse
func _mouse_entered():
	Input.set_custom_mouse_cursor(GlobalVariable.mouse_iter)
	pass # Replace with function body.

func _mouse_exited():
	Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	pass # Replace with function body.


func _mouse_entered_2():
	Input.set_custom_mouse_cursor(GlobalVariable.mouse_iter2)
	pass # Replace with function body.


# Utilizzo della chiave
func _on_Chiave_pressed():
	$Obiettivo.visible = true
	$TextureRect/Sfondo_cassetta.visible = false
	$TextureRect/Sfondo_chiave.visible = true
	GlobalVariable.chiave_inglese = 1
	pass # Replace with function body.

func _on_Esci_pressed_Chiave():
	$TextureRect/Sfondo_chiave.visible = false
	GlobalVariable.chiave_inglese = 0
	pass # Replace with function body.


# Puzzle del lavandino
func _on_Lavandino_pressed():
	if $TextureRect/Lavandino/Sprite.aggiustato == 1:
		$Obiettivo.visible = false
		$TextureRect/Sfondo_frammenti.visible = true
	pass # Replace with function body.
	
func _on_Esci_pressed_Lavandino():
	$Obiettivo.visible = true
	$TextureRect/Sfondo_frammenti.visible = false
	pass # Replace with function body.


# Utilizzo del secchio
func _on_Secchio_pressed():
	if GlobalVariable.pieno == 1:
		$TextureRect/Secchio.visible = false
		$TextureRect/Sfondo_secchio.visible = true
		Input.set_custom_mouse_cursor(GlobalVariable.mouse)
		GlobalVariable.secchio = 1
	pass # Replace with function body.
	
func _on_Esci_pressed_Secchio():
	$TextureRect/Sfondo_secchio.visible = false
	$TextureRect/Secchio.visible = true
	GlobalVariable.secchio = 0
	pass # Replace with function body.


var mouse_secchio = load("res://Global/img/secchio_storto.png")

func _mouse_entered_Pianta():
	if GlobalVariable.secchio == 1:
		Input.set_custom_mouse_cursor(mouse_secchio)
	else:
		Input.set_custom_mouse_cursor(GlobalVariable.mouse_iter)
	pass # Replace with function body.


var mouse_chiave = load("res://Global/img/chiave_storta.png")

func _mouse_entered_Lavandino():
	if GlobalVariable.chiave_inglese == 1:
		Input.set_custom_mouse_cursor(mouse_chiave)
	else:
		Input.set_custom_mouse_cursor(GlobalVariable.mouse_iter)
	pass # Replace with function body.
