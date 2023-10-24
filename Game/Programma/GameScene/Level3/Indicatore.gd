extends Label

onready var ogg = $Click

func _ready():
	$Completato.visible = false
	ogg.rect_size.y = 14
	$Timer.start()

func _process(delta):
	if Input.is_action_just_released("ui_select") and ogg.rect_size.y <= 384:
		ogg.rect_size.y +=  4
		ogg.rect_position.y -= 4

	if ogg.rect_size.y >= 372 and ogg != $Completato:
		$Completato.rect_size.y = $Click.rect_size.y
		$Completato.rect_position.y = $Click.rect_position.y
		ogg = $Completato
		$Completato.visible = true
	
	if ogg.rect_size.y <= 372 and ogg != $Click:
		$Click.rect_size.y = $Completato.rect_size.y
		$Click.rect_position.y = $Completato.rect_position.y
		ogg = $Click
		$Completato.visible = false


func _on_Timer_timeout():
	if ogg.rect_size.y >= 14 and ogg.rect_size.y < 384:
		$Timer.start()
		ogg.rect_size.y -= 2
		ogg.rect_position.y += 2
	pass # Replace with function body.
