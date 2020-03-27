extends Area2D

signal player_hit
var player_speed = 550
var score = 0
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	position = Vector2(50, 450)
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	if Input.is_key_pressed(87):
		velocity.y -= 1
	if Input.is_key_pressed(83):
		velocity.y += 1
	if Input.is_key_pressed(65):
		velocity.x -= 1
	if Input.is_key_pressed(68):
		velocity.x += 1 
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * player_speed
	
	position += velocity * delta
	position.x = clamp(position.x, 16, screen_size.x - 16)
	position.y = clamp(position.y, 16, screen_size.y - 16)

# Called when enemy hits player
func _on_Player_body_entered(body):
	if body.get_name() == "Enemy":
		hide()
		emit_signal("player_hit")

func restart():
	hide()
	position = Vector2(50, 450) 
