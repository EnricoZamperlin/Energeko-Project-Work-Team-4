extends Sprite

func _process(delta):
	if GlobalVariable.pieno == 1:
		set_texture(preload("res://GameScene/Level2/img/Secchio/Secchio_pieno.png"))
	elif GlobalVariable.pieno == 2:
		set_texture(preload("res://GameScene/Level2/img/Secchio/Secchio.png"))
