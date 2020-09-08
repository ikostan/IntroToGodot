extends Node2D


func _on_Area2D_body_entered(body):
	$Area2D/AudioStreamPlayer2D.play()
	get_tree().call_group('GameState', 'win_game')
