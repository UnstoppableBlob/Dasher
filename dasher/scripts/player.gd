extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var anim_player = $AnimationPlayer

const SPEED = 50
@export var is_attacking = false

func _physics_process(delta: float) -> void:
	var input_dir = Vector2.ZERO
	input_dir = Input.get_vector("left", "right", "up", "down")
	input_dir = input_dir.normalized()
	if input_dir.x != 0:
		if Input.is_action_just_pressed("attack"):
			anim_player.play("isattacking")
			anim.play("attackright")
			print("ran")
		if !is_attacking:
			anim.play("walkright")
		anim.flip_h = input_dir.x < 0
	elif input_dir.y == 1:
		if Input.is_action_just_pressed("attack"):
			anim_player.play("isattacking")
			anim.play("attackfront")
		if !is_attacking:
			anim.play("walkfront")
	elif input_dir.y == -1:
		if Input.is_action_just_pressed("attack"):
			anim_player.play("isattacking")
			anim.play("attackback")
		if !is_attacking:
			anim.play("walkback")
	else:
		if Input.is_action_just_pressed("attack"):
			anim_player.play("isattacking")
			anim.play("attackfront")
		if !is_attacking:
			anim.play("idlefront")
	

		
	if !is_attacking:
		velocity = input_dir * SPEED

	move_and_slide()
