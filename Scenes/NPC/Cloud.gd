extends Node2D

var reload = false


func _process(delta):
	if $Sprite/CloudRayCast2D.is_colliding():
		fire()


func fire():
	if not reload:
		var globals = preload("res://Levels/GameState.gd")
		if globals.DEBUG:
			print(self.name, ' > ', 'fire')
			
		$Sprite/CloudRayCast2D.add_child(load("res://Scenes/Hazards/Lighting.tscn").instance())
		$Sprite/Timer.start()
		reload = true


func _on_Timer_timeout():
	reload = false
