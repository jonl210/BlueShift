extends KinematicBody2D

var direction = Vector2(0, 0)
var speed = 590

func _ready():
	hide()
	$CollisionShape2D.disabled = true
	randomize()

func enable_collision():
	$CollisionShape2D.disabled = false

func set_enemy_position():
	position = Vector2(500, 10)

func restart():
	hide()
	direction = Vector2(0, 0)
	set_enemy_position()
	pass

func set_random_direction():
	var random_x = 0
	
	if randi() % 10 < 5:
		random_x = 1
	else:
		random_x = -1
	
	direction = Vector2(random_x, rand_range(1, -1)) * speed 

func _physics_process(delta):
	var collision = move_and_collide(direction * delta)
	if collision:
		direction = direction.bounce(collision.normal)
