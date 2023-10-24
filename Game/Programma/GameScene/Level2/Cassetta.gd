extends Sprite

var chiusa = true

func _on_Cassetta_pressed():
	if chiusa:
		set_texture(preload("res://GameScene/Level2/img/Cassetta/Cassetta2.png"))
		chiusa = false
		
		$Chiave.visible = true
		$Chiave.disabled = false
	elif not chiusa:
		set_texture(preload("res://GameScene/Level2/img/Cassetta/Cassetta1.png"))
		chiusa = true
		
		$Chiave.visible = false
		$Chiave.disabled = true
	pass # Replace with function body.
