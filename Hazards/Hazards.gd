extends Area2D


func _on_SpikesTop_body_entered(body):
	"SpikesTop listener"
	
	# DEBUG only
	# load GLOBALS
	var globals = preload("res://Levels/GameState.gd")
	if globals.get('DEBUG'):
		print(self.name, ' > ', '_on_SpikesTop_body_entered')
	
	get_tree().call_group('GameState', 'applay_damage')
