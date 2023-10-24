extends ColorRect

var frmt1 = 0
var frmt2 = 0
var frmt3 = 0
var frmt4 = 0


func _on_F1_pressed():
	if frmt1 == 1:
		$Frammento1.rect_position = Vector2(805.714, 617.143)
		$Frammento1.disabled = true
		GlobalVariable.rottura += 1
	pass # Replace with function body.

func _on_F2_pressed():
	if frmt2 == 1:
		$Frammento2.rect_position = Vector2(714.3, 517.6)
		$Frammento2.disabled = true
		GlobalVariable.rottura += 1
	pass # Replace with function body.

func _on_F3_pressed():
	if frmt3 == 1:
		$Frammento3.rect_position = Vector2(830, 691.429)
		$Frammento3.disabled = true
		GlobalVariable.rottura += 1
	pass # Replace with function body.

func _on_F4_pressed():
	if frmt4 == 1:
		$Frammento4.rect_position = Vector2(850, 792.857)
		$Frammento4.disabled = true
		GlobalVariable.rottura += 1
	pass # Replace with function body.


func _on_Frammento1_pressed():
	frmt1 = 1
	
	frmt2 = 0
	frmt3 = 0
	frmt4 = 0
	pass # Replace with function body.

func _on_Frammento2_pressed():
	frmt2 = 1
	
	frmt1 = 0
	frmt3 = 0
	frmt4 = 0
	pass # Replace with function body.

func _on_Frammento3_pressed():
	frmt3 = 1
	
	frmt1 = 0
	frmt2 = 0
	frmt4 = 0
	pass # Replace with function body.

func _on_Frammento4_pressed():
	frmt4 = 1
	
	frmt1 = 0
	frmt2 = 0
	frmt3 = 0
	pass # Replace with function body.
