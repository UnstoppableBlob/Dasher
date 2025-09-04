extends RigidBody2D

var other = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	global_position = Vector2.ZERO
	global_rotation = randf_range(0, TAU)
	var forward_direction = Vector2.RIGHT.rotated(global_rotation)
	apply_central_impulse(forward_direction * 200)

func _on_area_2d_body_entered(body) -> void:
	print("running1")
	if other && body is CharacterBody2D:
		print("running2")
		Global.player_speed = 20
		queue_free()


func _on_timer_timeout() -> void:
	print("timer is working")
	other = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("running1")
	if area.has_method("hitbox"):
		print("runnign3")
	if other && area.has_method("hitbox"):
		print("running2")
		Global.player_speed = 20
		queue_free()
