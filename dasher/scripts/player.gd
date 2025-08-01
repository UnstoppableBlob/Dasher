extends CharacterBody2D


const SPEED = 50


func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
