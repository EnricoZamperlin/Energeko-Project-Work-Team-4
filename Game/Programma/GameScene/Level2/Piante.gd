extends Sprite


func _on_Pianta1_pressed():
	if GlobalVariable.secchio == 1:
		GlobalVariable.pianta += 1
		$Pianta1.disabled = true
		$Pianta1.visible = false
		Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	pass # Replace with function body.

func _on_Pianta2_pressed():
	if GlobalVariable.secchio == 1:
		GlobalVariable.pianta += 1
		$Pianta2.disabled = true
		$Pianta2.visible = false
		Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	pass # Replace with function body.

func _on_Pianta3_pressed():
	if GlobalVariable.secchio == 1:
		GlobalVariable.pianta += 1
		$Pianta3.disabled = true
		$Pianta3.visible = false
		Input.set_custom_mouse_cursor(GlobalVariable.mouse)
	pass # Replace with function body.
