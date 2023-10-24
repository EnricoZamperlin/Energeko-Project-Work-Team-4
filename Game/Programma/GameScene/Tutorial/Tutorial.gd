extends Node

var num = 0
var collisione = false

var W = false
var S = false
var A = false
var D = false
var SHIFT = false
var E = false


func _ready():
	$Geko/Null/Intro.visible = false
	$Geko/AnimatedPlayer.visible = false
	$Geko/Null/Tasti.visible = false
	
	$Geko/Null/Intro/Label1.visible = true
	$Geko/Null/Intro/Label2.visible = false
	$Geko/Null/Intro/Label3.visible = false
	
	$Geko.position = GlobalVariable.posizione
	
	$Geko/Null/Tasti/W.visible = true
	$Geko/Null/Tasti/S.visible = false
	$Geko/Null/Tasti/A.visible = false
	$Geko/Null/Tasti/D.visible = false
	$Geko/Null/Tasti/E.visible = false
	$Geko/Null/Tasti/SHIFT.visible = false
	
	$Vittoria.visible = false
	
	
func _process(delta):
	$Mappa/Label.visible = false
	
	# TUTORIAL
	if not GlobalVariable.tutorial:
		if not W:
			if Input.is_key_pressed(KEY_W):
				$Pulsazione.start()
				$Geko/Null/Tasti/W.visible = false
				$Geko/Null/Tasti/S.visible = true
				W = true
		elif not S:
			if Input.is_key_pressed(KEY_S):
				$Pulsazione.start()
				$Geko/Null/Tasti/S.visible = false
				$Geko/Null/Tasti/A.visible = true
				S = true
		elif not A:
			if Input.is_key_pressed(KEY_A):
				$Pulsazione.start()
				$Geko/Null/Tasti/A.visible = false
				$Geko/Null/Tasti/D.visible = true
				A = true
		elif not D:
			if Input.is_key_pressed(KEY_D):
				$Pulsazione.start()
				$Geko/Null/Tasti/D.visible = false
				$Geko/Null/Tasti/W.visible = true
				$Geko/Null/Tasti/SHIFT.visible = true
				D = true
		elif not SHIFT:
			if Input.is_key_pressed(KEY_SHIFT) and Input.is_key_pressed(KEY_W):
				$Pulsazione.start()
				$Geko/Null/Tasti/W.visible = false
				$Geko/Null/Tasti/SHIFT.visible = false
				SHIFT = true
		elif not E:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$Timer.start()
			numT = 2
				
			collisione = true
			E = true
	
	# COLLISIONE
	if collisione:
		if $Geko/RayCast2D.is_colliding():
			var collider = $Geko/RayCast2D.get_collider()
			if collider and "Mappa" in collider.name:
				$Mappa/Label.visible = true
				$Geko/Null/Tasti.visible = true
				
				if Input.is_key_pressed(KEY_E):
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					$Geko/Null/Tasti.visible = false
					$Vittoria.rect_position.x = $Geko/AnimatedPlayer.position.x - ($Vittoria.rect_size.x/2) + 100
					$Vittoria.visible = true
					$Mappa/CollisionShape2D.disabled = true
					num = 0
					GlobalVariable.tutorial = true
			else:
				$Geko/Null/Tasti.visible = false
		else:
			$Geko/Null/Tasti.visible = false
	

func _on_Button1_pressed():
	$Geko/Null/Intro/Label1.visible = false
	$Geko/Null/Intro/Label2.visible = true
	pass # Replace with function body.


func _on_Button2_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	$Geko/Null/Intro.visible = false
	$Geko/Null/Tasti.visible = true
	num += 1
	GlobalVariable.tutorial = false
	$Geko/AnimatedPlayer.visible = true
	pass # Replace with function body.


func _on_Button3_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	$Geko/Null/Intro.visible = false
	GlobalVariable.tutorial = false
	pass # Replace with function body.

var numT = 0
func _on_Timer_timeout():
	if numT == 0:
		$Geko/Null/Intro.visible = true
		numT = 1
	elif numT == 2:
		$Geko/Null/Tasti.visible = false
		$Geko/Null/Tasti/E.visible = true
		
		$Geko/Null/Intro.visible = true
		$Geko/Null/Intro/Label2.visible = false
		$Geko/Null/Intro/Label3.visible = true
		
		GlobalVariable.tutorial = true
		numT += 1
	pass # Replace with function body.


func _on_Button_pressed():
	GlobalVariable.posizione = Vector2(44, -29)
	GlobalVariable.tutorial = false
	SceneTransition.change_scene("res://GameScene/Mappa/Mappa.tscn")
	pass # Replace with function body.


func _on_Pulsazione_timeout():
	
	# Lampeggio movimento
	if not GlobalVariable.tutorial:
		if not W:
			$Geko/Null/Tasti/W.visible = not $Geko/Null/Tasti/W.visible
		elif not S:
			$Geko/Null/Tasti/S.visible = not $Geko/Null/Tasti/S.visible
		elif not A:
			$Geko/Null/Tasti/A.visible = not $Geko/Null/Tasti/A.visible
		elif not D:
			$Geko/Null/Tasti/D.visible = not $Geko/Null/Tasti/D.visible
		elif not SHIFT:
			$Geko/Null/Tasti/W.visible = not $Geko/Null/Tasti/W.visible
			$Geko/Null/Tasti/SHIFT.visible = not $Geko/Null/Tasti/SHIFT.visible
	
	# Lampeggio iterazione
	if $Geko/RayCast2D.is_colliding():
		var collider = $Geko/RayCast2D.get_collider()
		if collider and "Mappa" in collider.name:
			$Geko/Null/Tasti/E.visible = not $Geko/Null/Tasti/E.visible
			
	pass # Replace with function body.
