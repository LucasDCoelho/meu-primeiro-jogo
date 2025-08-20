extends RigidBody2D


func _ready() -> void:
	var tipos_carros = $AnimatedSprite2D.sprite_frames.get_animation_names();
	var carro = tipos_carros[randi_range(0, tipos_carros.size() - 1)];
	$AnimatedSprite2D.animation = carro;
