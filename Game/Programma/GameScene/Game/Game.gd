extends Node

var num1 = 0
var num2 = 0

func _ready():
	GlobalVariable.tutorial = false
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Geko.position = GlobalVariable.posizione
	
	$Porta1/CollisionShape2D.disabled = false
	$Porta2/CollisionShape2D.disabled = false
	$Porta3/CollisionShape2D.disabled = false
	$Porta4/CollisionShape2D.disabled = false
	
	$Mappa/CollisionShape2D.disabled = false

func _process(delta):
	$Porta1/Label.visible = false
	$Porta1/Complete.visible = false
	#
	$Porta2/Label.visible = false
	$Porta2/Vincolo.visible = false
	$Porta2/Complete.visible = false
	#
	$Porta3/Label.visible = false
	$Porta3/Vincolo1.visible = false
	$Porta3/Vincolo2.visible = false
	$Porta3/Complete.visible = false
	#
	$Porta4/Label.visible = false
	
	$Mappa/Label.visible = false
	
	# COLLISIONE
	if $Geko/RayCast2D.is_colliding():
		var collider = $Geko/RayCast2D.get_collider()
		if collider and "Porta1" in collider.name:
			if not GlobalVariable.level1:
				$Porta1/Label.visible = true
			else:
				$Porta1/Complete.visible = true
			#
			if Input.is_key_pressed(KEY_E) and not GlobalVariable.level1:
				GlobalVariable.posizione = $Geko.position
				SceneTransition.change_scene("res://GameScene/Level1/Level.tscn")
		elif collider and "Porta2" in collider.name:
			if GlobalVariable.level2:
				$Porta2/Complete.visible = true
			elif GlobalVariable.level1:
				$Porta2/Label.visible = true
			else:
				$Porta2/Vincolo.visible = true
			#
			if Input.is_key_pressed(KEY_E) and GlobalVariable.level1 and not GlobalVariable.level2:
				GlobalVariable.posizione = $Geko.position
				SceneTransition.change_scene("res://GameScene/Level2/Level.tscn")
		elif collider and "Porta3" in collider.name:
			if GlobalVariable.level3:
				$Porta3/Complete.visible = true
			elif GlobalVariable.level2:
				$Porta3/Label.visible = true
			elif GlobalVariable.level1:
				$Porta3/Vincolo2.visible = true
			else:
				$Porta3/Vincolo1.visible = true
			#
			if Input.is_key_pressed(KEY_E) and GlobalVariable.level2 and not GlobalVariable.level3:
				GlobalVariable.posizione = $Geko.position
				SceneTransition.change_scene("res://GameScene/Level3/Level.tscn")
		elif collider and "Porta4" in collider.name:
			$Porta4/Label.visible = true
		elif collider and "Mappa" in collider.name:
			$Mappa/Label.visible = true
			if Input.is_key_pressed(KEY_E):
				GlobalVariable.posizione = $Geko.position
				SceneTransition.change_scene("res://GameScene/Mappa/Mappa.tscn")
