extends Sprite

var aggiustato = 0

func _on_Lavandino_pressed():
	if aggiustato == 0 and GlobalVariable.chiave_inglese == 1:
		set_texture(preload("res://GameScene/Level2/img/Lavandino/Lavandino_rotto.png"))
		aggiustato += 1
		GlobalVariable.pieno = 1
	
	pass # Replace with function body.
