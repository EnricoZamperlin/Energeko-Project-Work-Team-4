extends Sprite

var luce = true

func _on_Neon_pressed():
	if luce:
		set_texture(preload("res://GameScene/Level3/img/Luce/Luce2.png"))
		luce = false
	elif not luce:
		set_texture(preload("res://GameScene/Level3/img/Luce/Luce1.png"))
		luce = true
	
	pass # Replace with function body.
