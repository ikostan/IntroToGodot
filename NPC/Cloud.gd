extends Node2D

var reload = false


func _process(delta):
	if $Sprite/CloudRayCast2D.is_colliding() and not reload:
		fire()
		reload = true
		$Sprite/Timer.start()


func fire():
	var globals = preload("res://Levels/GameState.gd")
	if globals.DEBUG:
		print(self.name, ' > ', 'fire')
	add_child(load("res://Hazards/Lighting.tscn").instance())


func _on_Timer_timeout():
	reload = false
