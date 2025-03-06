extends CharacterBody2D

@export var speed = 100 
var screen_size
var direction = "down"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direction = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		input_direction.x += 1
		direction = "right"
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
		direction = "left"
	if Input.is_action_pressed("down"):
		input_direction.y += 1
		direction = "down"
	if Input.is_action_pressed("up"):
		input_direction.y -= 1
		direction = "up"
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		velocity = input_direction * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	move_and_slide()
	position = position.clamp(Vector2.ZERO, screen_size - Vector2(1, 1))
