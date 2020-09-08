extends AnimatedSprite


func _on_Player_animate(player_position):
	"Animation script: walk left, walk right, jump, idle"
	
	if player_position.x < 0:
		flip_h = true
		play('walk')
		speed_scale = 3
	elif player_position.x > 0:
		flip_h = false
		play('walk')
		speed_scale = 3
	elif player_position.y < 0:
		play('jump')
		speed_scale = 1
	else:
		play('idle')
		speed_scale = 1
