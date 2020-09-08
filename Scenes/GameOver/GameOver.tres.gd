extends TextureButton


func _on_TryAgain_pressed():
	"Try again button listener"
	# load GLOBALS
	var globals = preload("res://Levels/GameState.gd")
	if globals.DEBUG:
		print(self.name, ' > ', '_on_TryAgain_pressed')
		
	get_tree().change_scene("res://Levels/Level_1.tscn")
	

func _on_Exit_pressed():
	"Exit button  listener"
	
	# load GLOBALS
	var globals = preload("res://Levels/GameState.gd")
	if globals.DEBUG:
		print(self.name, ' > ', '_on_Exit_pressed')
	
	get_tree().quit()
