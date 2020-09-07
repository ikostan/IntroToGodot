extends KinematicBody2D

signal animate

var player_position = Vector2(0,0)

const GRAVITY = 250
const WALK_SPEED = 1500
const JUMP_SPEED = 3600
const UP = Vector2(0,-1)
const WORLD_END = 10000
const BOOST = 1.2


func _physics_process(delta):
		
	applay_graviation()
	walk()
	jump()
	animate_player()
	move_and_slide(player_position, UP)


func applay_graviation():
		
	if position.y > WORLD_END:
		
		# load GLOBALS
		var globals = preload("res://Levels/GameState.gd")
		if globals.DEBUG:
			print(self.name, ' > ', 'applay_graviation', ' > fell off')
			
		get_tree().call_group('GameState', 'game_over')
	
	if is_on_floor():
		player_position.y = 0
	elif is_on_ceiling():
		player_position.y = 1
	else:
		player_position.y += GRAVITY


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		player_position.y = -JUMP_SPEED
		# play sound
		#$AudioStreamJump.stream = load("res://SFX/jump1.ogg")
		$AudioStreamJump.play()


func animate_player():
	"Activates animate listener in order to animate the player"
	emit_signal('animate', player_position)


func hurt():
	# load GLOBALS
	var globals = preload("res://Levels/GameState.gd")
	if globals.DEBUG:
		print(self.name, ' > ', 'hurt')
	
	# play sound
	#$AudioStreamPain.stream = load("res://SFX/pain.ogg")
	$AudioStreamPain.play()
	
	# JUMP
	position.y -= 1
	yield(get_tree(), "idle_frame")
	player_position.y -= JUMP_SPEED / 1.5
		
		
func boost():
	"Boost the jump function when enters spring object"
	
	# load GLOBALS
	var globals = preload("res://Levels/GameState.gd")
	if globals.DEBUG:
		print(self.name, ' > ', 'boost')
	
	# JUMP + BOOST
	position.y -= 1
	yield(get_tree(), "idle_frame")
	player_position.y -= JUMP_SPEED * BOOST


func walk():
	"Walk: left, right, idle. Actions pressed based"
	
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		player_position.x = -WALK_SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		player_position.x = WALK_SPEED
	else:
		player_position.x = 0
