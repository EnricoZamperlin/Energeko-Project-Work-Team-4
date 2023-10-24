extends Sprite

var chiusa = true

func _on_Finestra_pressed():
	if chiusa:
		set_texture(preload("res://GameScene/Level2/img/Finestra/Finestra2.png"))
		chiusa = false
	elif not chiusa:
		set_texture(preload("res://GameScene/Level2/img/Finestra/Finestra1.png"))
		chiusa = true
	
	pass # Replace with function body.
