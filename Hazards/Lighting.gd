extends Node2D

const SPEED = 300


func _ready():
	$LightingArea2D/LightingAudioStreamPlayer.play()
	set_as_toplevel(true)
	global_position = get_parent().global_position


func _process(delta):
	position.y += SPEED * delta
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_LightingArea2D_body_entered(body):
	# Debug only
	var globals = preload("res://Levels/GameState.gd")
	if globals.get('DEBUG'):
		print(self.name, ' > ', '_on_LightingArea2D_body_entered')
	
	if body.name == 'Player':
		get_tree().call_group('GameState', 'applay_damage')
	queue_free()
