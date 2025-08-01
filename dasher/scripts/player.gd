extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 50


func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "up", "down")
	input_dir = input_dir.normalized()
	if input_dir.x != 0:
		anim.play("walkright")
		anim.flip_h = input_dir.x < 0
	elif input_dir.y == 1:
		anim.play("walkfront")
	elif input_dir.y == -1:
		anim.play("walkback")
	else:
		anim.play("idlefront")
		
	velocity = input_dir * SPEED

	move_and_slide()
