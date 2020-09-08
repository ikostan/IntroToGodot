extends Node2D

var taken: bool = false


func _on_Area2D_body_entered(body):
	"Coin listener"
	
	var globals = preload("res://Levels/GameState.gd")
	if globals.DEBUG:
		print(self.name, ' > ', '_on_Area2D_body_entered')
	
	if not taken:
		get_tree().call_group("GameState", 'update_coins')
		$AudioStreamPlayer2D.play()
		$AnimationPlayer.play("CoinDisappear")
		taken = true


func die():
	var globals = preload("res://Levels/GameState.gd")
	if globals.DEBUG:
		print(self.name, ' > ', 'die')
		
	queue_free()
