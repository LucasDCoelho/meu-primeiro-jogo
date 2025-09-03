extends RigidBody2D


func _ready() -> void:
	var frames = $AnimatedSprite2D.sprite_frames.get_frame_count("orc")
	var frame_index = randi_range(0, frames - 1)
	$AnimatedSprite2D.play("orc")
	$AnimatedSprite2D.frame = frame_index
