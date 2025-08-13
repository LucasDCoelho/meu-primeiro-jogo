extends Area2D

@export var speed: float = 100;
var screen_size: Vector2
var initial_position: Vector2 = Vector2(640,690)

func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = initial_position


func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"): 
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		$Animacao.animation = "baixo"
		velocity.y += 1
	if Input.is_action_pressed("move_up"): # Também pode usar ui_up
		$Animacao.animation = "cima"
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$Animacao.play()
	else:
		$Animacao.stop()
	
	position += velocity * delta
	position.y = clamp(position.y, 0.0, screen_size.y)
