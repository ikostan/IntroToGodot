extends TextureButton

# load GLOBALS
var globals = preload("res://Levels/GameState.gd")


func _on_TryAgain_pressed():
	"Try again button listener"
	
	if globals.DEBUG:
		print(self.name, ' > ', '_on_TryAgain_pressed')
		
	get_tree().change_scene("res://Levels/Level_1.tscn")
	

func _on_Exit_pressed():
	"Exit button  listener"
	
	if globals.DEBUG:
		print(self.name, ' > ', '_on_Exit_pressed')
	
	get_tree().quit()
