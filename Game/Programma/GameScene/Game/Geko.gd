extends KinematicBody2D

var num = 200

func _process(delta):
	
	# Inizializzo il vettore "velocity"
	var velocity = Vector2()
	
	# Aggiorno il vettore velocity in base all'input del giocatore
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
		$RayCast2D.cast_to = Vector2(0, -50)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
		$RayCast2D.cast_to = Vector2(0, 50)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -1
		$RayCast2D.cast_to = Vector2(-50, 0)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 1
		$RayCast2D.cast_to = Vector2(50, 0)
	
	if Input.is_key_pressed(KEY_SHIFT):
		num = 350
		$AnimatedPlayer.speed_scale = 2
	else:
		num = 200
		$AnimatedPlayer.speed_scale = 1
	
	# Blocco movimento
	if GlobalVariable.tutorial:
		velocity = Vector2()
		
	var movement = num * velocity.normalized() * delta
	
	self.move_and_collide(movement)
	self.update_animations(velocity)
	
	
func update_animations(velocity):
	if velocity.y == -1:
		$AnimatedPlayer.play("walk_up")
		$AnimatedPlayer.flip_h = false
	elif velocity.y == 1:
		$AnimatedPlayer.play("walk_down")
		$AnimatedPlayer.flip_h = false
	elif velocity.x == -1:
		$AnimatedPlayer.play("walk_left")
		$AnimatedPlayer.flip_h = false
	elif velocity.x == 1:
		$AnimatedPlayer.play("walk_left")
		$AnimatedPlayer.flip_h = true
	
	if velocity == Vector2():
		if $AnimatedPlayer.animation == "walk_up":
			$AnimatedPlayer.play("player_up")
		elif $AnimatedPlayer.animation == "walk_down":
			$AnimatedPlayer.play("player_down")
		elif $AnimatedPlayer.animation == "walk_left":
			$AnimatedPlayer.play("player_left")
