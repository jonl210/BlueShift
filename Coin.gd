extends Area2D

signal coin_collected
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$CollisionShape2D.disabled = true
	set_new_coin_position()

func enable_collision():
	$CollisionShape2D.disabled = false

func disable_collision():
	$CollisionShape2D.set_deferred("disabled", true)

# Called when player collects coin
func _on_Coin_area_entered(area):
	emit_signal("coin_collected")

func restart():
	hide()
	set_new_coin_position()

# Set new coin position when player collects it
func set_new_coin_position():
	random.randomize() 
	var random_x = random.randi_range(50, 500)
	var random_y = random.randi_range(50, 500)
	
	position = Vector2(random_x, random_y)
