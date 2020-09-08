extends Node2D

var reload = false


func _process(delta):
	if $Sprite/CloudRayCast2D.is_colliding():
		fire()


func fire():
	var globals = preload("res://Levels/GameState.gd")
	if globals.DEBUG:
			print(self.name, ' > ', 'fire')
	
	if not reload:
		$Sprite/CloudRayCast2D.add_child(load("res://Hazards/Lighting.tscn").instance())
		$Sprite/Timer.start()
		reload = true


func _on_Timer_timeout():
	reload = false
