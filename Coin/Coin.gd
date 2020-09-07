extends Node2D


func _on_Area2D_body_entered(body):
	"Coin listener"
	get_tree().call_group("GameState", 'update_coins')
