extends Sprite

var luce = true

func _on_Lampada_pressed():
	if luce:
		set_texture(preload("res://GameScene/Level1/img/Lampada/Lampada2.png"))
		luce = false
	elif not luce:
		set_texture(preload("res://GameScene/Level1/img/Lampada/Lampada1.png"))
		luce = true
	
	pass # Replace with function body.
