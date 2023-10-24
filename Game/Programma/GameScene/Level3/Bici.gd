extends Sprite

var bici = 0

func _on_Bici_pressed():
	
	if bici == 3:
		if $Label.visible:
			$Label.visible = false
		elif not $Label.visible:
			$Label.visible = true
	elif GlobalVariable.sellino == 1:
		set_texture(preload("res://GameScene/Level3/img/Bici/BiciSellino.png"))
		bici = 1
	
	pass # Replace with function body.


func _on_Si_pressed():
	$Label.visible = false
	bici = 4
	pass # Replace with function body.


func _on_No_pressed():
	$Label.visible = false
	pass # Replace with function body.
