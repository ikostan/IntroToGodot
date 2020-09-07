extends Area2D


func _on_Spring_body_entered(body):
	"Spring listener"
	
	if body.has_method('boost'):
		$AnimationPlayerSpring.play('boost')
		body.boost()
