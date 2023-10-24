extends Sprite

var chiusa = true

func _ready():
	$Cassetta_Armadio.visible = false
	$Cassetta_Armadio.disabled = false

func _on_Armadietto_pressed():
	if chiusa:
		set_texture(preload("res://GameScene/Level2/img/Armadietto/Armadietto_aperto.png"))
		chiusa = false
		$Cassetta_Armadio.visible = true
	elif not chiusa:
		set_texture(preload("res://GameScene/Level2/img/Armadietto/Armadietto_chiuso.png"))
		chiusa = true
		$Cassetta_Armadio.visible = false
		
	pass # Replace with function body.
