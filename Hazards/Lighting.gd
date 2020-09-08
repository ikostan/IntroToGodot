extends Area2D

const SPEED = 300


func _ready():
	$LightingAudioStreamPlayer.play()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
