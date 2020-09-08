extends Node2D

const SPEED = 350


func _ready():
	$LightingArea2D/LightingAudioStreamPlayer.play()
	set_as_toplevel(true)
	global_position = get_parent().global_position


func _process(delta):
	position.y += SPEED * delta
	pass


func _on_VisibilityNotifier2D_screen_exited():
	"Call destructor in case Lighting exited visible screen"
	# Debug only
	var globals = preload("res://Levels/GameState.gd")
	if globals.get('DEBUG'):
		print(self.name, ' > ', '_on_VisibilityNotifier2D_screen_exited')
	queue_free()


func _on_LightingArea2D_body_entered(body):
	"""Lighting listener: 
		1. hurt player if colided
		2. call destructor in case of any collision: terrain or player
	"""
	# Debug only
	var globals = preload("res://Levels/GameState.gd")
	if globals.get('DEBUG'):
		print(self.name, ' > ', '_on_LightingArea2D_body_entered')
	
	# hurt player if colided
	if body.name == 'Player':
		get_tree().call_group('GameState', 'applay_damage')
	
	# call destructor
	queue_free()
