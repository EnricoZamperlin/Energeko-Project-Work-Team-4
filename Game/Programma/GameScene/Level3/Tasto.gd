extends Button

var num = 0

func _on_Premuto_timeout():
	if num == 0:
		$Premuto.start()
		$Space.rect_position.y = -2
		num += 1
	else:
		$Premuto.start()
		$Space.rect_position.y = -7
		num -= 1
	pass # Replace with function body.
