extends Sprite

var luce = true

func _on_Lampadario_pressed():
	if luce:
		set_texture(preload("res://GameScene/Level1/img/Lampadario/Lampadario2.png"))
		luce = false
	elif not luce:
		set_texture(preload("res://GameScene/Level1/img/Lampadario/Lampadario1.png"))
		luce = true
	
	pass # Replace with function body.
