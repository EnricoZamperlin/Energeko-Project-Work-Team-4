extends Sprite

var chiuso = true

func _on_Serranda_pressed():
	if chiuso:
		set_texture(preload("res://GameScene/Level3/img/Serranda/Serranda2.png"))
		chiuso = false
	elif not chiuso:
		set_texture(preload("res://GameScene/Level3/img/Serranda/Serranda1.png"))
		chiuso = true
	
	pass # Replace with function body.
