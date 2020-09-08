extends Node2D

const DEBUG = true
const COINS_TO_LIVE = 10

var live = 10
var coins = 0


func _ready():
	add_to_group('GameState')
	update_gui()


func update_coins():
	coins += 1
	
	# auto exchange coins to lives
	if coins >= 10:
		var lives_diff = int(coins / COINS_TO_LIVE)
		live += lives_diff
		coins -= (lives_diff * COINS_TO_LIVE)
	
	update_gui()


func update_gui():
	get_tree().call_group('GUI', 'update_lives', live)
	get_tree().call_group('GUI', 'update_coins', coins)


func game_over():
	"Exit game level and open Game Over scene"
	
	if DEBUG:
		print(self.name, ' > ', 'game_over', ' live: ', live)
	get_tree().change_scene("res://Scenes/GameOver/GameOver.tscn")


func applay_damage():
	"Applay dammage on Player object"
	
	if $Player.has_method('hurt'):
		$Player.hurt()
		
	live -= 1
	update_gui()
	
	if live < 0:
		game_over()
		
	if DEBUG:
		print(self.name, ' > ', 'applay_damage', ' live: ', live)
	
