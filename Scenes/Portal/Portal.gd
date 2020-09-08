extends Node2D


func _on_Area2D_body_entered(body):
	# DEBUG only
	# load GLOBALS
	var globals = preload("res://Levels/GameState.gd")
	if globals.get('DEBUG'):
		print(self.name, ' > ', '_on_Area2D_body_entered', ' > player entered Portal')
	$Area2D/AudioStreamPlayer2D.play()
	get_tree().call_group('GameState', 'win_game')
