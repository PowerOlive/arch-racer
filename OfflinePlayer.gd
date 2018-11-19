extends KinematicBody

signal collided

var speed = 100
const MAX_SPEED = 10000
var score = 0
var num_collide = 0

func _ready():
	var ScoreLabel = get_node("/root/World/UI/Score")

func _physics_process(delta):

	if speed > 1000:
		if Input.is_key_pressed(KEY_D) || Input.is_key_pressed(KEY_RIGHT):
			rotate(Vector3(0,1,0), deg2rad(-2))
		
		if Input.is_key_pressed(KEY_A) || Input.is_key_pressed(KEY_LEFT):
			rotate(Vector3(0,1,0), deg2rad(2))
	
	if Input.is_key_pressed(KEY_W) || Input.is_key_pressed(KEY_UP):
		
		if speed < MAX_SPEED:
			speed += 200
	
	else:
		speed *= 0.99
	
	if Input.is_key_pressed(KEY_S) || Input.is_key_pressed(KEY_DOWN):
		speed *= 0.95;
	
	if test_move(transform, get_global_transform().basis.x.normalized() * delta * speed * 0.001) == true:
		emit_signal("collided")
		pass
	
	move_and_slide(get_global_transform().basis.x.normalized() * delta * speed)