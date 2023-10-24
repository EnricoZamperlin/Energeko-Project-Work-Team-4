extends Node

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	$Intro.visible = true
	
	$Vittoria.visible = false
	$Obiettivo.visible = false
	
	$TextureRect/Serranda.disabled = true
	$TextureRect/Bici.disabled = true
	$TextureRect/Gomme/Sellino.visible = false
	$TextureRect/Gomme.disabled = true
	$TextureRect/Pompetta.disabled = true
	$TextureRect/Chiave.disabled = true
	$TextureRect/Mensola.disabled = true
	$TextureRect/Neon1.disabled = true
	$TextureRect/Neon2.disabled = true
	
	$TextureRect/Auto/Cont.visible = false
	
	$TextureRect/Sfondo_chiave.visible = false
	$TextureRect/Sfondo_casco.visible = false
	$TextureRect/Sfondo_sellino.visible = false
	$TextureRect/Sfondo_pompetta.visible = false
	
	$TextureRect/Bici/Sprite/Label.visible = false

var num1 = 0
var num2 = 0
var primo = ""

func _process(delta):
	# Per vincere
	if $TextureRect/Bici/Sprite.bici == 4 and not $TextureRect/Serranda/Sprite.chiuso and GlobalVariable.casco == 1:
		$Obiettivo.visible = false
		$Vittoria.visible = true
		GlobalVariable.level3= true
	
	# Controllo
	if num1 == 1 and num2 == 1:
		# Bici aggiustata
		$TextureRect/Bici/Sprite.set_texture(preload("res://GameScene/Level3/img/Bici/Bici.png"))
		if not $TextureRect/Bici.is_connected("mouse_entered", self, "_mouse_entered"):
			$TextureRect/Bici.connect("mouse_entered", self, "_mouse_entered")
		$TextureRect/Bici/Sprite.bici = 3
	elif $TextureRect/Bici/Sprite.bici == 1 and num1 == 0:
		# Bici con sellino, gomma sgonfia
		$TextureRect/Sfondo_sellino.visible = false
		$TextureRect/Gomme/SpriteS.visible = false
		$TextureRect/Gomme/Sellino.visible = false
		$TextureRect/Bici.disconnect("mouse_entered", self, "_mouse_entered")
		_mouse_exited()
		num1 += 1
	elif $TextureRect/Bici/Sprite.bici == 2 and num2 == 0:
		# Bici con gomma gonfia, No sellino 
		$TextureRect/Bici/Sprite.set_texture(preload("res://GameScene/Level3/img/Bici/BiciGomma.png"))
		num2 += 1
	
	# Oggetto in mano (max 1)
	if $TextureRect/Sfondo_chiave.is_visible_in_tree() and not $TextureRect/Sfondo_sellino.is_visible_in_tree():
		primo = "chiave"
	elif $TextureRect/Sfondo_sellino.is_visible_in_tree() and not $TextureRect/Sfondo_chiave.is_visible_in_tree():
		primo = "sellino"
	elif $TextureRect/Sfondo_chiave.is_visible_in_tree() and $TextureRect/Sfondo_sellino.is_visible_in_tree():
		if primo == "chiave":
			_on_Esci_pressed_Chiave()
		elif primo == "sellino":
			_on_Esci_pressed_Sellino()
		

func _back():
	SceneTransition.change_scene("res://GameScene/Game/Game.tscn")
	pass # Replace with function body.


func _on_Button_pressed():
	$Obiettivo.visible = true
	$Intro.visible = false
	
	$TextureRect/Serranda.disabled = false
	$TextureRect/Bici.disabled = false
	$TextureRect/Gomme.disabled = false
	$TextureRect/Pompetta.disabled = false
	$TextureRect/Chiave.disabled = false
	$TextureRect/Mensola.disabled = false
	$TextureRect/Neon1.disabled = false
	$TextureRect/Neon2.disabled = false
	
	$TextureRect/Auto/Cont.visible = true
	
	Input.set_custom_mouse_cursor(GlobalVariable.mouse)
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
	$TextureRect/Chiave.visible = false
	$TextureRect/Sfondo_chiave.visible = true
	$TextureRect/Auto/Cont/A1.connect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A2.connect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A3.connect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A4.connect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A5.connect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A6.connect("mouse_entered", self, "_mouse_entered")
	GlobalVariable.chiave = 1
	_mouse_exited()
	pass # Replace with function body.

func _on_Esci_pressed_Chiave():
	$TextureRect/Sfondo_chiave.visible = false
	$TextureRect/Chiave.visible = true
	$TextureRect/Auto/Cont/A1.disconnect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A2.disconnect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A3.disconnect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A4.disconnect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A5.disconnect("mouse_entered", self, "_mouse_entered")
	$TextureRect/Auto/Cont/A6.disconnect("mouse_entered", self, "_mouse_entered")
	GlobalVariable.chiave = 0
	$TextureRect/Auto/Sprite/Label.visible = false
	pass # Replace with function body.


func _on_Casco_pressed():
	$TextureRect/Sfondo_casco.visible = true
	GlobalVariable.casco = 1
	$TextureRect/Auto/Sprite.set_texture(preload("res://GameScene/Level3/img/Auto/Auto2.png"))
	$TextureRect/Auto/Sprite/Casco.visible = false
	$TextureRect/Auto/Sprite/Label.visible = false
	pass # Replace with function body.

func _on_Esci_pressed_Casco():
	$TextureRect/Sfondo_casco.visible = false
	GlobalVariable.casco = 0
	if GlobalVariable.auto == 1:
		$TextureRect/Auto/Sprite.set_texture(preload("res://GameScene/Level3/img/Auto/Auto1.png"))
		$TextureRect/Auto/Sprite/Casco.visible = true
	elif GlobalVariable.auto == 0:
		$TextureRect/Auto/Sprite.set_texture(preload("res://GameScene/Level3/img/Auto/Auto.png"))
		$TextureRect/Auto/Sprite/Casco.visible = false
	pass # Replace with function body.


var numG = 0
func _on_Gomme_pressed():
	if numG == 0:
		$TextureRect/Gomme/Sprite.modulate = "4bffffff"
		if GlobalVariable.sellino == 0:
			$TextureRect/Gomme/Sellino.visible = true
		numG += 1
	else:
		$TextureRect/Gomme/Sprite.modulate = "ffffff"
		$TextureRect/Gomme/Sellino.visible = false
		numG = 0
	pass # Replace with function body.


func _on_Sellino_pressed():
	$TextureRect/Sfondo_sellino.visible = true
	$TextureRect/Gomme/SpriteS.visible = false
	$TextureRect/Bici.connect("mouse_entered", self, "_mouse_entered")
	GlobalVariable.sellino = 1
	_on_Gomme_pressed()
	pass # Replace with function body.

func _on_Esci_pressed_Sellino():
	$TextureRect/Sfondo_sellino.visible = false
	$TextureRect/Gomme/SpriteS.visible = true
	$TextureRect/Bici.disconnect("mouse_entered", self, "_mouse_entered")
	GlobalVariable.sellino = 0
	if numG != 0:
		$TextureRect/Gomme/Sellino.visible = true
	pass # Replace with function body.


func _on_Pompetta_pressed():
	$TextureRect/Sfondo_pompetta.visible = true
	$TextureRect/Bici.visible = false
	$Obiettivo.visible = false
	pass # Replace with function body.

func _on_Esci_pressed_Pompetta():
	$TextureRect/Sfondo_pompetta.visible = false
	$TextureRect/Bici.visible = true
	$Obiettivo.visible = true
	if $TextureRect/Sfondo_pompetta/Indicatore.ogg.rect_size.y >= 384:
		$TextureRect/Pompetta.disabled = true
		$TextureRect/Pompetta.disconnect("mouse_entered", self, "_mouse_entered")
		$TextureRect/Bici/Sprite.bici = 2
	$TextureRect/Sfondo_pompetta/Indicatore.ogg.rect_size.y = 14
	$TextureRect/Sfondo_pompetta/Indicatore.ogg.rect_position.y = 380
	pass # Replace with function body.
