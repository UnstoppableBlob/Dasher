extends RigidBody2D

var other = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	global_position = Vector2.ZERO
	global_rotation = randf_range(0, TAU)
	var forward_direction = Vector2.RIGHT.rotated(global_rotation)
	apply_central_impulse(forward_direction * 100)
var x = 1
var y = 1
func _process(delta: float) -> void:
	y += 1
	if y == 150:
		y = 0
		linear_velocity = Vector2.ZERO
		angular_velocity = 0.0
		global_rotation = randf_range(0, TAU)
		var forward_direction = Vector2.RIGHT.rotated(global_rotation)
		apply_central_impulse(forward_direction * 100)
func _on_area_2d_body_entered(body) -> void:
	if other && body is CharacterBody2D:
		Global.player_speed = 60
		queue_free()


func _on_timer_timeout() -> void:
	other = true
