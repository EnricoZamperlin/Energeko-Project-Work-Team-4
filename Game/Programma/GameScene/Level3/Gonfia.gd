extends Sprite

var num = 0

func _on_Premuto_timeout():
	if num == 0:
		set_texture(preload("res://GameScene/Level3/img/Gonfia/Gonfia1.png"))
		num += 1
	else:
		set_texture(preload("res://GameScene/Level3/img/Gonfia/Gonfia2.png"))
		num -= 1
	pass # Replace with function body.
