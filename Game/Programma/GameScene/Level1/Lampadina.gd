extends Sprite

var luce = true

func _on_Lampadina1_pressed():
	if luce:
		set_texture(preload("res://GameScene/Level1/img/Lampadina/Lampadina2.png"))
		luce = false
	elif not luce:
		set_texture(preload("res://GameScene/Level1/img/Lampadina/Lampadina1.png"))
		luce = true
	
	pass # Replace with function body.


func _on_Lampadina2_pressed():
	if luce:
		set_texture(preload("res://GameScene/Level1/img/Lampadina/Lampadina2.png"))
		luce = false
	elif not luce:
		set_texture(preload("res://GameScene/Level1/img/Lampadina/Lampadina1.png"))
		luce = true
	
	pass # Replace with function body.
