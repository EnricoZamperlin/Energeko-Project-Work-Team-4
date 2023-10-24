extends Sprite

var chiuso = true

func _ready():
	$Casco.visible = false
	$Casco.disabled = false
	$Label.visible = false

func _on_Auto_pressed():
	if GlobalVariable.chiave == 1 or GlobalVariable.chiave == 3:
		if $Label.visible:
			$Label.visible = false
		elif not $Label.visible:
			$Label.visible = true
			
		GlobalVariable.chiave = 3
	pass # Replace with function body.


func _on_usa_pressed():
	$Label.visible = false
	pass # Replace with function body.


func _on_apri_pressed():
	$Label.visible = false
	
	if chiuso:
		$Label/apri.text = "chiudi cofano"
		if GlobalVariable.casco == 0:
			set_texture(preload("res://GameScene/Level3/img/Auto/Auto1.png"))
			$Casco.visible = true
		elif GlobalVariable.casco == 1:
			set_texture(preload("res://GameScene/Level3/img/Auto/Auto2.png"))
			$Casco.visible = false
		GlobalVariable.auto = 1
		chiuso = false
	elif not chiuso:
		$Label/apri.text = "apri cofano"
		set_texture(preload("res://GameScene/Level3/img/Auto/Auto.png"))
		$Casco.visible = false
		GlobalVariable.auto = 0
		chiuso = true
	pass # Replace with function body.
