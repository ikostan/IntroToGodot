extends Node2D

const DEBUG = true

var live = 10


func _ready():
	add_to_group('GameState')


func game_over():
	"Exit game level and open Game Over scene"
	
	if DEBUG:
		print(self.name, ' > ', 'game_over', ' live: ', live)
	get_tree().change_scene("res://GameOver/GameOver.tscn")


func applay_damage():
	"Applay dammage on Player object"
	
	if $Player.has_method('hurt'):
		$Player.hurt()
		
	live -= 1
	if live < 0:
		game_over()
		
	if DEBUG:
		print(self.name, ' > ', 'applay_damage', ' live: ', live)
	
