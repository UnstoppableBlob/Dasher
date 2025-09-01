extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	global_position = Vector2.ZERO
	global_rotation = randf_range(0, TAU)
	var forward_direction = Vector2.RIGHT.rotated(global_rotation)
	apply_central_impulse(forward_direction * 300)

func _on_area_2d_body_entered(body) -> void:
	print(";alkjdfsssssssssssssssssssssssssssssssss")
	Global.player_speed = 10
